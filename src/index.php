<?php
$conf = array('dbServer'=>'localhost',
              'dbUser'=>  'autocorr',
              'dbPass'=>  'autocorr',
              'dbName'=>  'autocorr');

$db = ($GLOBALS["___mysqli_ston"] = mysqli_connect($conf['dbServer'],  $conf['dbUser'],  $conf['dbPass']))
    or exit('Nepavyko prisijungti prie duomenų bazės. Patikrinkite konfigūraciją.<br />Klaidos pranešimas: '.mysqli_error($GLOBALS["___mysqli_ston"]));
mysqli_select_db( $db, $conf['dbName'])
    or exit('Nepavyko išrinkti duomenų bazės. Patikrinkite konfigūraciją.<br />Klaidos pranešimas: '.mysqli_error($GLOBALS["___mysqli_ston"]));
((bool)mysqli_set_charset( $db, "utf8"));

// 'Magic quotes' pašalinimas,
// nukopijuotas iš http://talks.php.net/show/php-best-practices/26
if (get_magic_quotes_gpc()) {
	$in = array(&$_GET, &$_POST, &$_COOKIE, &$_REQUEST);
	while (list($k,$v) = each($in)) {
		foreach ($v as $key => $val) {
			if (!is_array($val)) {
				$in[$k][$key] = stripslashes($val);
				continue;
			}
			$in[] =& $in[$k][$key];
		}
	}
	unset($in);
}
session_set_cookie_params(3600); // 30 min.
session_start();

if(array_key_exists('user', $_REQUEST) && array_key_exists('password', $_REQUEST)) {
	$query = sprintf("SELECT * FROM `users` WHERE `username`='%s'",
	                 mysqli_real_escape_string($GLOBALS["___mysqli_ston"], $_REQUEST['user']));
	$result = mysqli_query( $db, $query)
	        or exit('Nepavyko patikrinti bandančio prisijungti naudotojo duomenų.<br />Klaidos pranešimas: ' . mysqli_error($GLOBALS["___mysqli_ston"]));
	if(mysqli_num_rows($result) > 0) {
		$user = mysqli_fetch_assoc($result);
		if($user['password'] == crypt($_REQUEST['password'], $user['password'])) {
			$_SESSION['user'] = array('id' => $user['id'], 'password' => $user['password']);
		} else {
			$loginMessage = 'Prisijungti nepavyko: blogas slaptažodis';
			unset($user);
		}
	} else {
		$loginMessage = 'Prisijungti nepavyko: blogas naudotojo vardas';
	}
} else if(array_key_exists('logout', $_REQUEST)) {
	unset($_SESSION['user']);
	unset($user);
} else if(array_key_exists('user', $_SESSION)) {
	$query = sprintf("SELECT * FROM `users` WHERE `id`='%s' AND `password`='%s'",
	                 mysqli_real_escape_string($GLOBALS["___mysqli_ston"], $_SESSION['user']['id']),
	                 mysqli_real_escape_string($GLOBALS["___mysqli_ston"], $_SESSION['user']['password']));
	$result = mysqli_query( $db, $query)
	        or exit('Nepavyko patikrinti sesijoje nurodyto naudotojo duomenų.<br />Klaidos pranešimas: ' . mysqli_error($GLOBALS["___mysqli_ston"]));
	if(mysqli_num_rows($result) > 0) {
		$user = mysqli_fetch_assoc($result);
	}
}
if(array_key_exists('abbreviatedName', $_REQUEST) && array_key_exists('name', $_REQUEST)) {
	$abbreviatedName = trim($_REQUEST['abbreviatedName']);
	$name = trim($_REQUEST['name']);
	$comment = trim($_REQUEST['comment']);
	if(!empty($abbreviatedName) && !empty($name)) {
		$query = sprintf("SELECT * FROM `documentList` WHERE LOWER(`abbreviatedName`)=LOWER('%s') AND LOWER(`name`)=LOWER('%s') COLLATE 'utf8_bin'",
		                 mysqli_real_escape_string($GLOBALS["___mysqli_ston"], $abbreviatedName),
		                 mysqli_real_escape_string($GLOBALS["___mysqli_ston"], $name));
		$result = mysqli_query( $db, $query)
			or exit('Nepavyko patikrinti, ar įrašas yra duomenų bazėje.<br />Klaidos pranešimas: '.mysqli_error($GLOBALS["___mysqli_ston"]));
		$dupe = false;
		if(mysqli_num_rows($result) > 0)
		{
			for($i = 0; $i < mysqli_num_rows($result); $i++)
			{
				$word = mysqli_fetch_assoc($result);
				if(strtolower($word['abbreviatedName'] == strtolower($abbreviatedName)) 
				&& strtolower($word['name'] == strtolower($name))) {
					$dupe = true;
				}
			}
		}

		if($dupe) {
			$message = '<span style="color: #cc0000;">Ši pora jau įvesta</span>';
		} else {
			$query = sprintf("INSERT INTO `documentList` SET `abbreviatedName`='%s', `name`='%s', `comment`='%s'",
			                 mysqli_real_escape_string($GLOBALS["___mysqli_ston"], $abbreviatedName),
			                 mysqli_real_escape_string($GLOBALS["___mysqli_ston"], $name),
			                 mysqli_real_escape_string($GLOBALS["___mysqli_ston"], $comment));
			$result = mysqli_query( $db, $query)
				or exit('Nepavyko įterpti įrašo į duomenų bazę.<br />Klaidos pranešimas: '.mysqli_error($GLOBALS["___mysqli_ston"]));
			$message = '<span style="color: #00cc00;">Pasiūlymas priimtas</span>';
		}
	}
}
if(array_key_exists('updated', $_REQUEST)) {
	$message = 'Atnaujinta porų: '.$_REQUEST['updated'];
}

$query = 'SELECT * FROM `documentList` ORDER BY `abbreviatedName` ASC, `name` ASC';
$result=mysqli_query( $db, $query)
	or exit('Nepavyko įvykdyti užklausos duomenų bazėje.<br />Klaidos pranešimas: '.mysqli_error($GLOBALS["___mysqli_ston"]));
if(mysqli_num_rows($result) > 0)
{
	$words = array();
	$abbreviatedNames = array();
	// Visus rezultatus patalpiname į masyvą
	for($i = 0; $i < mysqli_num_rows($result); $i++)
	{
		$words[$i] = mysqli_fetch_assoc($result);
		if(array_key_exists($words[$i]['abbreviatedName'], $abbreviatedNames)) {
			$abbreviatedNames[$words[$i]['abbreviatedName']]['count']++;
		} else {
			$abbreviatedNames[$words[$i]['abbreviatedName']] = array();
			$abbreviatedNames[$words[$i]['abbreviatedName']]['first_id'] = $words[$i]['id'];
			$abbreviatedNames[$words[$i]['abbreviatedName']]['count'] = 1;
		}
	}
}

switch($_REQUEST['action']) {
	case "export":
		if(is_array($_REQUEST['sel'])) {
			header('Content-Type: text/xml; charset=utf-8');
			header('Content-Disposition: attachment; filename=DocumentList.xml');
			echo("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
			echo("<!-- AutoCorrect list is generated from input provided by visitors of\n     http://autocorr.akl.lt/\n-->\n");
			echo("<block-list:block-list xmlns:block-list=\"http://openoffice.org/2001/block-list\">\n");
			foreach($words as $word) {
				if(in_array($word['id'], $_REQUEST['sel'])) {
					echo("\t<block-list:block block-list:abbreviated-name=\""
					   . htmlspecialchars($word['abbreviatedName'])
					   . "\" block-list:name=\""
					   . htmlspecialchars($word['name'])
					   . "\"/>\n");
				}
			}
			echo("</block-list:block-list>");
			exit();
			break;
		}
	case "export-ask":
		if(is_array($_REQUEST['sel'])) {
			header('Content-Type: text/xml; charset=utf-8');
			header('Content-Disposition: attachment; filename=autotext.xml');
			echo("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n");
			echo("<!-- This AutoCorrect list is generated from input provided by visitors of\n     http://autocorr.akl.lt/\n-->\n");
			echo("<words>\n");
			foreach($words as $word) {
				if(in_array($word['id'], $_REQUEST['sel'])) {
					echo("    <word src=\""
					   . htmlspecialchars($word['abbreviatedName'])
					   . "\">"
					   . htmlspecialchars($word['name'])
					   . "</word>\n");
				}
			}
			echo("</words>");
			exit();
			break;
		}
	case "update": 
		if($user && is_array($_REQUEST['status']) && is_array($_REQUEST['comment'])) {
			$updatedWords = 0;
			foreach($_REQUEST['status'] as $wordId=>$status) {
				$query = sprintf('UPDATE `documentList` SET `status`="%s", `comment`="%s" WHERE `id`="%s"',
				                 mysqli_real_escape_string($GLOBALS["___mysqli_ston"], $status),
				                 mysqli_real_escape_string($GLOBALS["___mysqli_ston"], $_REQUEST['comment'][$wordId]),
				                 mysqli_real_escape_string($GLOBALS["___mysqli_ston"], $wordId));
				$result = mysqli_query($GLOBALS["___mysqli_ston"], $query)
				        or exit('Nepavyko atnaujinti žodyno.<br />Klaidos pranešimas: '.mysqli_error($db));
				$updatedWords += mysqli_affected_rows($db);
			}
/*
			foreach(array('ACCEPTED','REJECTED','UNDECIDED') as $possibleStatus) {
				$wordsToUpdate = array();
				foreach($_REQUEST['status'] as $wordId=>$status) {
					if($status == $possibleStatus) {
						$wordsToUpdate[] = mysql_real_escape_string($wordId);
					}
				}
				if(!empty($wordsToUpdate)) {
					$query = 'UPDATE `documentList` SET `status`="'.$possibleStatus.'" WHERE `id` IN("'.implode('","',$wordsToUpdate).'")';
					$result = mysql_query($query)
						or exit('Nepavyko atnaujinti žodyno.<br />Klaidos pranešimas: '.mysql_error($db));
					$updatedWords += mysql_affected_rows($db);
				}
			}
*/
			header('Location: '.$_SERVER['PHP_SELF'].'?updated='.$updatedWords);
			exit();
			break;
		}
}

echo("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"); ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Lietuviškas automatinio taisymo žodynas</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="robots" content="noindex, nofollow" />
	<link rel="stylesheet" type="text/css" href="style.css" />
	<script type="text/javascript" src="scripts.js"></script>
	<script type="text/javascript" src="sorttable.js"></script>
</head>
<body>
<h1>Lietuviškas automatinio taisymo žodynas</h1>
<p>Žemiau rasite šio tinklalapio autoriaus bei lankytojų pateiktus pasiūlymus laisvajam lietuviškam automatinio taisymo (angl. AutoCorrect) žodynui. Jeigu manote, kad sąraše kažko trūksta, galite pateikti ir savo pasiūlymą. Taip pat galite siūlyti ir alternatyvas jau pateiktiems siūlymams.</p>
<p><strong>Dėmesio!</strong> Pateikdami pasiūlymą, Jūs automatiškai parodote sutikimą, kad jame pateikta informacija būtų naudojama žodyne, platinamame remiantis labai liberalia (tikriausiai BSD tipo) licencija arba pagal „Public Domain“ modelį (t.&nbsp;y., atsisakant bet kokių autorinių teisių į jį). Jeigu norite, kad Jūsų vardas būtų paminėtas tarp autorių, galite prisistatyti lauke „Pastaba“.</p>
<p>Jeigu turite klausimų ar pasiūlymų dėl paties tinklalapio, galite juos siųsti <a href="&#109;&#097;&#105;&#108;&#116;&#111;:&#114;&#113;&#064;&#097;&#107;&#108;&#046;&#108;&#116;">Rimui</a></p>
<?php if(is_array($words)) { ?>
<form method="post" action="<?php echo($_SERVER['PHP_SELF']); ?>">
	<table class="sortable" id="words">
		<thead>
			<tr>
				<th class="sorttable_nosort hidden" id="col1head">Žymėti</th>
				<th class="sorttable_alpha" id="col2head" title="Spustelėkite, jeigu norite sąrašą perrikiuoti pagal šį lauką">Klaida</th>
				<th class="sorttable_alpha" id="col3head" title="Spustelėkite, jeigu norite sąrašą perrikiuoti pagal šį lauką">Taisyti į</th>
				<th class="sorttable_nosort" id="col4head">Pastabos</th>
				<th id="col5head" title="Spustelėkite, jeigu norite sąrašą perikiuoti pagal šį lauką">Būsena</th>
			</tr>
		</thead>
		<tbody>
	<?php
				foreach($words as $word) {
					switch($word['status']) {
						case 'ACCEPTED':
							echo("\t\t<tr class=\"accepted\">\n");
							echo("\t\t\t<td class=\"hidden col1\">");
							if($abbreviatedNames[$word['abbreviatedName']]['count'] == 1) {
								echo("<input type=\"checkbox\" checked=\"checked\" name=\"sel[".$word['id']."]\" value=\"".$word['id']."\" /></td>\n");
							} else {
								echo("<input type=\"radio\" name=\"sel[" . $abbreviatedNames[$word['abbreviatedName']]['first_id'] . "]\" value=\"".$word['id']."\" /></td>\n");
							}
							break;
						case 'REJECTED':
							echo("\t\t<tr class=\"rejected\">\n");
							echo("\t\t\t<td class=\"hidden col1\">");
							if($abbreviatedNames[$word['abbreviatedName']]['count'] == 1) {
								echo("<input type=\"checkbox\" name=\"sel[".$word['id']."]\" value=\"".$word['id']."\" /></td>\n");
							} else {
								echo("<input type=\"radio\" name=\"sel[" . $abbreviatedNames[$word['abbreviatedName']]['first_id'] . "]\" value=\"".$word['id']."\" /></td>\n");
							}
							break;
						default:
							echo("\t\t<tr>\n");
							echo("\t\t\t<td class=\"hidden col1\">");
							if($abbreviatedNames[$word['abbreviatedName']]['count'] == 1) {
								echo("<input type=\"checkbox\" name=\"sel[".$word['id']."]\" value=\"".$word['id']."\" /></td>\n");
							} else {
								echo("<input type=\"radio\" name=\"sel[" . $abbreviatedNames[$word['abbreviatedName']]['first_id'] . "]\" value=\"".$word['id']."\" /></td>\n");
							}
					}
					echo("\t\t\t<td class=\"col2\"><span>".htmlspecialchars($word['abbreviatedName'])."</span></td>\n");
					echo("\t\t\t<td class=\"col3\"><span>".htmlspecialchars($word['name'])."</span></td>\n");
					if(isset($user)) {
						echo("\t\t\t<td class=\"col4\"><input type=\"text\" name=\"comment[".$word['id']."]\" value=\"".htmlspecialchars($word['comment'])."\" /></td>\n");
					} else {
						echo("\t\t\t<td class=\"col4\">".htmlspecialchars($word['comment'])."</td>\n");
					}
					echo("\t\t\t<td class=\"col5\" sorttable_customkey=\"".$word['status']."\">\n");
					if(isset($user)) {
						echo("\t\t\t\t<select name=\"status[" . $word['id']."]\">\n");
						foreach(array('ACCEPTED'=>'priimta', 'REJECTED'=>'atmesta', 'UNDECIDED'=>'nenuspręsta') as $status => $statusName) {
							echo("\t\t\t\t\t<option value=\"$status\"");
							if($status == $word['status']) { echo " selected=\"selected\""; }
							echo(">$statusName</option>\n");
						}
						echo("\t\t\t\t</select>\n");
					} else {
						$possibleStatusValues = array('ACCEPTED'=>'priimta', 'REJECTED'=>'atmesta', 'UNDECIDED'=>'');
						echo("\t\t\t\t".$possibleStatusValues[$word['status']]."\n");
					}
					echo("\t\t\t</td>\n");
					echo("\t\t</tr>\n");
				}
	?>
		</tbody>
	</table>
<?php if ($user) { ?>
	<p><button type="submit" name="action" value="update">Įrašyti</button> pakeitimus</p>
<?php } ?>
	<p class="hidden">Eksportuoti pažymėtas poras į <button type="submit" name="action" value="export">„OpenOffice“/„LibreOffice“</button> arba <button type="submit" name="action" value="export-ask">„AnySoftKeyboard“</button> žodyno failą</p>
</form>
<?php } else {
	echo("\t<p>Kol kas žodynas tuščias</p>\n");
} ?>

<form method="post" action="<?php echo($_SERVER['PHP_SELF']); ?>">
	<fieldset>
<?php if(!empty($message)) { ?>
		<p><?php echo($message); ?></p>
<?php } ?>
		
<legend>Pasiūlykite žodžių porą</legend>
		<label>*Klaida: <input type="text" name="abbreviatedName" placeholder="privalomas laukas" /></label><br />
		<label>*Taisyti į: <input type="text" name="name" placeholder="privalomas laukas" /></label><br />
		<label>Pastaba: <input type="text" name="comment" /></label><br />
		<button type="submit">Siųsti</button>
	</fieldset>
</form>
<?php if($user) { ?>
<p class="hidden" id="loginForm"><?php echo $user['name'] ?>. <a href="<?php echo($_SERVER['PHP_SELF']); ?>?logout">Atsijungti</a></p>
<?php } else { ?>
<form class="hidden" method="post" action="<?php echo($_SERVER['PHP_SELF']); ?>" id="loginForm">
	<fieldset>
<?php if(!empty($loginMessage)) { ?>
		<p><?php echo($loginMessage); ?></p>
<?php } ?>
		<legend>Prisijungimas</legend>
		<label>Naudotojas: <input type="text" name="user" /></label><br />
		<label>Slaptažodis: <input type="password" name="password" /></label><br />
		<button type="submit">Prisijungti</button>
	</fieldset>
</form>
<?php } ?>
<p id="footer">Tinklalapio autorius – <a href="&#109;&#097;&#105;&#108;&#116;&#111;:&#114;&#113;&#064;&#097;&#107;&#108;&#046;&#108;&#116;">Rimas Kudelis</a> <img src="smile.png" alt=":)" id="smiley" onclick="changeCSS('.hidden', 'display', null);" /></p>
</body>
</html>
