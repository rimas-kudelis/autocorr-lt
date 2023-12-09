-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 2023 m. Grd 09 d. 14:43
-- Server version: 10.3.25-MariaDB-0+deb10u1
-- PHP Version: 7.3.29-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `autocorr`
--

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `documentList`
--

CREATE TABLE `documentList` (
  `id` int(10) UNSIGNED NOT NULL,
  `abbreviatedName` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL,
  `status` enum('ACCEPTED','REJECTED','UNDECIDED') COLLATE utf8_lithuanian_ci NOT NULL DEFAULT 'UNDECIDED'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Sukurta duomenų kopija lentelei `documentList`
--

INSERT INTO `documentList` (`id`, `abbreviatedName`, `name`, `comment`, `status`) VALUES
(21, 'ens', 'nes', '', 'ACCEPTED'),
(22, 'apei', 'apie', '', 'ACCEPTED'),
(23, 'akd', 'kad', '', 'ACCEPTED'),
(24, 'agl', 'gal', '', 'ACCEPTED'),
(25, 'greai', 'gerai', '', 'ACCEPTED'),
(26, '->', '→', '', 'ACCEPTED'),
(27, '--', '–', 'Du minusai → brūkšnys', 'ACCEPTED'),
(28, '-->', '→', '', 'ACCEPTED'),
(29, '...', '…', 'Trys taškai → daugtaškis', 'ACCEPTED'),
(30, '(C)', '©', '', 'ACCEPTED'),
(31, '(R)', '®', '', 'ACCEPTED'),
(32, '(tm)', '™', '', 'ACCEPTED'),
(33, '<--', '←', '', 'ACCEPTED'),
(34, '<-', '←', '', 'ACCEPTED'),
(35, '<-->', '↔', '', 'ACCEPTED'),
(36, '<->', '↔', '', 'ACCEPTED'),
(37, 'darugas', 'draugas', '', 'ACCEPTED'),
(38, 'kda', 'kad', 'Galėtų būti tiek „kad“, tiek „kada“. Geriau nerizikuoti.', 'REJECTED'),
(39, 'ri', 'ir', '', 'ACCEPTED'),
(47, 'stadijonas', 'stadionas', '', 'ACCEPTED'),
(41, 'pasiųlymas', 'pasiūlymas', '', 'ACCEPTED'),
(42, 'siųlyti', 'siūlyti', '', 'ACCEPTED'),
(43, 'nse', 'nes', '', 'ACCEPTED'),
(44, 'visdėlto', 'vis dėlto', '', 'ACCEPTED'),
(45, 'ištikrųjų', 'iš tikrųjų', '', 'ACCEPTED'),
(46, 'kažaks', 'kažkas', '', 'ACCEPTED'),
(48, '(P)', '℗', 'Šis simbolis rečiau naudojamas, ir net ne visuose šriftuose yra, tad kol kas nežymiu kaip priimto.', 'ACCEPTED'),
(49, 'bsu', 'bus', '', 'ACCEPTED'),
(50, 'i', 'į', '', 'ACCEPTED'),
(51, 'šoi', 'šio', '', 'ACCEPTED'),
(52, 'šei', 'šie', '', 'ACCEPTED'),
(53, 'ati', 'tai', '', 'ACCEPTED'),
(54, 't.y.', 't. y.', '', 'ACCEPTED'),
(55, 'blogiua', 'blogiau', '', 'ACCEPTED'),
(56, 'geriua', 'geriau', '', 'ACCEPTED'),
(57, 'kalida', 'klaida', '', 'ACCEPTED'),
(58, 'įdėja', 'idėja', 'Gramatikos klaida, per daug formų', 'UNDECIDED'),
(59, 'akda', 'kada', '', 'ACCEPTED'),
(61, 'kolidorius', 'koridorius', 'Dažna gramatikos klaida, trūksta formų', 'ACCEPTED'),
(62, 'musm', 'mums', '', 'ACCEPTED'),
(63, 'tirkai', 'tikrai', '', 'ACCEPTED'),
(64, 'šeip', 'šiaip', '', 'ACCEPTED'),
(65, 'ksda', 'kada', '', 'ACCEPTED'),
(76, 'beabejo', 'be abejo', '', 'ACCEPTED'),
(67, 'dviems', 'dviem', 'Laisvuosiuose stiliuose tinka ir „dviems“: http://vlkk.lt/lit/1018', 'REJECTED'),
(68, 'tasi', 'tarsi', '', 'UNDECIDED'),
(69, 'amn', 'man', '', 'ACCEPTED'),
(70, 'paie', 'apie', '', 'ACCEPTED'),
(71, 'bnet', 'bent', '', 'ACCEPTED'),
(72, 'vsio', 'viso', '', 'ACCEPTED'),
(73, ',,', '„', 'Du kableliai → atidarančioji kabutė', 'ACCEPTED'),
(74, 'abiems', 'abiem', 'VLKK rašo, kad priimtini abu variantai: http://www.vlkk.lt/lit/2509', 'REJECTED'),
(75, 'tiap', 'taip', '', 'ACCEPTED'),
(77, 'klaba', 'kalba', '', 'ACCEPTED'),
(78, 'įdėjos', 'idėjos', 'Gramatikos klaida, per daug formų', 'UNDECIDED'),
(159, 'tasi', 'tąsi', '', 'UNDECIDED'),
(80, 'įdėjoje', 'idėjoje', 'Gramatikos klaida, per daug formų', 'UNDECIDED'),
(81, 'įdėją', 'idėją', 'Gramatikos klaida, per daug formų', 'UNDECIDED'),
(82, 'įdėjų', 'idėjų', 'Gramatikos klaida, per daug formų', 'UNDECIDED'),
(83, 'įdėjoms', 'idėjoms', 'Gramatikos klaida, per daug formų', 'UNDECIDED'),
(84, 'įdėjas', 'idėjas', 'Gali būti ir klaidingai užrašytas žodis „įdėjęs“', 'REJECTED'),
(85, 'įdėjomis', 'idėjomis', 'Gramatikos klaida, per daug formų', 'UNDECIDED'),
(86, 'įdėjose', 'idėjose', 'Gramatikos klaida, per daug formų', 'UNDECIDED'),
(87, 'pasiųlymo', 'pasiūlymo', '', 'ACCEPTED'),
(88, 'pasiųlymui', 'pasiūlymui', '', 'ACCEPTED'),
(89, 'pasiųlymą', 'pasiūlymą', '', 'ACCEPTED'),
(90, 'pasiųlymu', 'pasiūlymu', '', 'ACCEPTED'),
(91, 'pasiųlyme', 'pasiūlyme', '', 'ACCEPTED'),
(92, 'siūsti', 'siųsti', '', 'ACCEPTED'),
(93, 'pasiųlymai', 'pasiūlymai', '', 'ACCEPTED'),
(94, 'pasiųlymų', 'pasiūlymų', '', 'ACCEPTED'),
(95, 'pasiųlymams', 'pasiūlymams', '', 'ACCEPTED'),
(96, 'pasiųlymus', 'pasiūlymus', '', 'ACCEPTED'),
(97, 'pasiųlymais', 'pasiūlymais', '', 'ACCEPTED'),
(98, 'pasiųlymuose', 'pasiūlymuose', '', 'ACCEPTED'),
(99, 'gryžti', 'grįžti', '', 'ACCEPTED'),
(100, 'j', 'į', 'Nėra žodžio j, o dažnai OCR suklysta', 'ACCEPTED'),
(101, 'trugdyti', 'trukdyti', '', 'ACCEPTED'),
(102, 't.t.', 't. t.', '', 'ACCEPTED'),
(103, 'aju', 'jau', '', 'ACCEPTED'),
(104, 'atri', 'arti', '', 'ACCEPTED'),
(105, 'ivs', 'vis', '', 'ACCEPTED'),
(553, 'nukentėtūm', 'nukentėtum', '', 'UNDECIDED'),
(107, 'pažystamas', 'pažįstamas', '', 'ACCEPTED'),
(108, 'pažystama', 'pažįstama', '', 'ACCEPTED'),
(109, 'pažystamo', 'pažįstamo', '', 'ACCEPTED'),
(110, 'pažystamos', 'pažįstamos', '', 'ACCEPTED'),
(111, 'pažystamam', 'pažįstamam', '', 'ACCEPTED'),
(112, 'pažystamu', 'pažįstamu', '', 'ACCEPTED'),
(113, 'pažystamą', 'pažįstamą', '', 'ACCEPTED'),
(114, 'pažystamame', 'pažįstamame', '', 'ACCEPTED'),
(115, 'pažystamoje', 'pažįstamoje', '', 'ACCEPTED'),
(116, 'vis gi', 'visgi', '', 'ACCEPTED'),
(117, 'siųti', 'siūti', '', 'ACCEPTED'),
(118, 'ačiu', 'ačiū', '', 'ACCEPTED'),
(119, 'spraktelėti', 'spragtelėti', '', 'ACCEPTED'),
(120, 'kaškas', 'kažkas', '', 'ACCEPTED'),
(121, 'perdaug', 'per daug', '', 'ACCEPTED'),
(122, 'per nelyg', 'pernelyg', '', 'ACCEPTED'),
(123, 'lietuva', 'Lietuva', '', 'ACCEPTED'),
(124, 'pažysti', 'pažįsti', '', 'ACCEPTED'),
(125, 'laitą', 'laiptą', '', 'UNDECIDED'),
(126, 'laitu', 'laiptu', '', 'UNDECIDED'),
(127, 'laite', 'laipte', '', 'UNDECIDED'),
(128, ' “', '“', 'Naikinam tarpą prieš uždarančiąją kabutę', 'ACCEPTED'),
(129, ' . ', '. ', 'Naikinam tarpą prieš tašką', 'ACCEPTED'),
(130, ' , ', ', ', 'Naikinam tarpą prieš kablelį', 'ACCEPTED'),
(131, '„ ', '„', 'Naikinam tarpą po atidarančiosios kabutės', 'ACCEPTED'),
(132, 'manes', 'manęs', '', 'ACCEPTED'),
(133, 'staptelėti', 'stabtelėti', '', 'UNDECIDED'),
(134, 'staptelėjau', 'stabtelėjau', '', 'UNDECIDED'),
(135, 'staptelėjai', 'stabtelėjai', '', 'UNDECIDED'),
(136, 'staptelėjo', 'stabtelėjo', '', 'UNDECIDED'),
(137, 'staptelėjome', 'stabtelėjome', '', 'UNDECIDED'),
(138, 'staptelėjote', 'stabtelėjote', '', 'UNDECIDED'),
(139, 'bilijardas', 'biliardas', '', 'ACCEPTED'),
(140, 'siv', 'vis', '', 'UNDECIDED'),
(141, 'pažystamają', 'pažįstamąją', '', 'ACCEPTED'),
(142, 'nepažystamają', 'nepažįstamąją', '', 'ACCEPTED'),
(143, 'nepažystama', 'nepažįstama', '', 'ACCEPTED'),
(144, 'nepažystamas', 'nepažįstamas', '', 'ACCEPTED'),
(145, 'nepažystamo', 'nepažįstamo', '', 'ACCEPTED'),
(146, 'nepažysti', 'nepažįsti', '', 'ACCEPTED'),
(147, 'nepažystamą', 'nepažįstamą', '', 'ACCEPTED'),
(148, 'nepažystamam', 'nepažįstamam', '', 'ACCEPTED'),
(149, 'nepažystamame', 'nepažįstamame', '', 'ACCEPTED'),
(150, 'nepažystamoje', 'nepažįstamoje', '', 'ACCEPTED'),
(151, 'nepažystamos', 'nepažįstamos', '', 'ACCEPTED'),
(152, 'nepažystamu', 'nepažįstamu', '', 'ACCEPTED'),
(153, 'pažystu', 'pažįstu', '', 'ACCEPTED'),
(154, 'nepažystu', 'nepažįstu', '', 'ACCEPTED'),
(155, 'pradei', 'pradedi', '', 'UNDECIDED'),
(156, 'kas kart', 'kaskart', '', 'ACCEPTED'),
(157, 'eji', 'jei', '', 'ACCEPTED'),
(158, 'ačių', 'ačiū', '', 'ACCEPTED'),
(161, 'temsi', 'tempsi', '', 'UNDECIDED'),
(162, 'laika', 'laiką', 'Laika – šunų veislė', 'REJECTED'),
(163, 'samokslas', 'sąmokslas', '', 'ACCEPTED'),
(164, 'samokslo', 'sąmokslo', '', 'ACCEPTED'),
(165, 'samokslui', 'sąmokslui', '', 'ACCEPTED'),
(166, 'samoksla', 'sąmokslą', '', 'ACCEPTED'),
(167, 'samokslu', 'sąmokslu', '', 'ACCEPTED'),
(168, 'samoksle', 'sąmoksle', '', 'ACCEPTED'),
(169, 'samokslai', 'sąmokslai', '', 'ACCEPTED'),
(170, 'samokslų', 'sąmokslų', '', 'ACCEPTED'),
(171, 'samokslams', 'sąmokslams', '', 'ACCEPTED'),
(172, 'samokslus', 'sąmokslus', '', 'ACCEPTED'),
(173, 'samokslais', 'sąmokslais', '', 'ACCEPTED'),
(174, 'samoksluose', 'sąmoksluose', '', 'ACCEPTED'),
(175, 'samoksliškai', 'sąmoksliškai', '', 'UNDECIDED'),
(176, 'samoksliškuose', 'sąmoksliškuose', '', 'UNDECIDED'),
(177, 'samoksliskuose', 'sąmoksliškuose', '', 'UNDECIDED'),
(555, 'jungenčius', 'jungiančius', '', 'UNDECIDED'),
(179, 'nutesiau', 'nutęsiau', 'Gali būti ir „nutiesiau“', 'REJECTED'),
(180, 'nutysiau', 'nutįsiau', '', 'ACCEPTED'),
(181, 'kalidorius', 'koridorius', 'Gramatikos klaida, per daug formų', 'UNDECIDED'),
(554, 'vienavertus', 'viena vertus', '', 'UNDECIDED'),
(185, 'lysti', 'lįsti', '', 'ACCEPTED'),
(186, 'ilysti', 'įlįsti', '', 'ACCEPTED'),
(187, 'palysti', 'palįsti', '', 'ACCEPTED'),
(188, 'užlysti', 'užlįsti', '', 'ACCEPTED'),
(189, 'nulysti', 'nulįsti', '', 'ACCEPTED'),
(190, 'tūrėtu', 'turėtų', '', 'UNDECIDED'),
(191, 'primigtinai', 'primygtinai', '', 'ACCEPTED'),
(192, 'koje', 'koja', 'Ar tai dažna klaida?', 'UNDECIDED'),
(193, 'deje', 'deja', '', 'ACCEPTED'),
(194, 'beja', 'beje', '', 'ACCEPTED'),
(195, 'tūrėjau', 'turėjau', '', 'UNDECIDED'),
(196, 'siūnta', 'siunta', '', 'UNDECIDED'),
(197, 'rėžimas', 'režimas', '„rėžimas“ taip pat gali būti veiksmažodinis daiktavardis', 'UNDECIDED'),
(198, 'kalejmas', 'kalėjimas', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(199, 'kaleimas', 'kalėjimas', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(200, 'tūrėt', 'turėt', '', 'UNDECIDED'),
(201, 'deją', 'deja', '', 'REJECTED'),
(202, 'sustingi', 'sustingti', '', 'UNDECIDED'),
(203, 'syki', 'sykį', '', 'UNDECIDED'),
(204, 'kadangį', 'kadangi', 'Ar ši klaida dažna?', 'UNDECIDED'),
(205, 'jt', 'jį', 'Ar ši klaida dažna?', 'UNDECIDED'),
(206, 'foto sesija', 'fotosesija', 'Gramatikos klaida, per daug formų', 'UNDECIDED'),
(207, 'foto sesijos', 'fotosesijos', 'Gramatikos klaida, per daug formų', 'UNDECIDED'),
(208, 'pasigerėjimas', 'pasigėrėjimas', '', 'ACCEPTED'),
(209, 'trukinėja', 'trūkinėja', '', 'UNDECIDED'),
(210, 'trukinėju', 'trūkinėju', '', 'UNDECIDED'),
(211, 'trukinėjame', 'trūkinėjame', '', 'UNDECIDED'),
(212, 'trukinėjate', 'trūkinėjate', '', 'UNDECIDED'),
(213, 'mastyti', 'mąstyti', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(551, 'tuoletas', 'tualetas', '', 'UNDECIDED'),
(549, 'kaikurie', 'kai kurie', '', 'UNDECIDED'),
(548, 'įdomes', 'įdomias', '', 'UNDECIDED'),
(217, 'mastai', 'mąstai', '„mastai“ – žodžio „mastas“ daugiskaita', 'REJECTED'),
(546, 'kitavertus', 'kita vertus', '', 'UNDECIDED'),
(545, 'kitavertus', 'kitavertus', '', 'UNDECIDED'),
(220, 'mislė', 'mįslė', '', 'ACCEPTED'),
(221, 'myslė', 'mįslė', '', 'ACCEPTED'),
(222, 'apmastyti', 'apmąstyti', 'Gramatikos klaida, per daug formų, per retas žodis', 'REJECTED'),
(543, 'tačaiu', 'tačiau', '', 'UNDECIDED'),
(540, 'gyevno', 'gyveno', '', 'UNDECIDED'),
(539, 'didžiosiso', 'didžiosios', '', 'ACCEPTED'),
(228, 'foto sesijai', 'fotosesijai', 'Gramatikos klaida, per daug formų', 'UNDECIDED'),
(229, 'foto sesiją', 'fotosesiją', 'Gramatikos klaida, per daug formų', 'UNDECIDED'),
(230, 'foto sesijoje', 'fotosesijoje', 'Gramatikos klaida, per daug formų', 'UNDECIDED'),
(231, 'foto sesijose', 'fotosesijose', 'Gramatikos klaida, per daug formų', 'UNDECIDED'),
(232, 'nusiplukusi', 'nusiplūkusi', '', 'UNDECIDED'),
(233, 'nusiplukes', 'nusiplūkęs', '', 'UNDECIDED'),
(234, 'nusiplukti', 'nusiplūkti', '', 'UNDECIDED'),
(235, 'pluktis', 'plūktis', '', 'UNDECIDED'),
(236, 'suprunksčiau', 'suprunkščiau', '', 'UNDECIDED'),
(237, 'įsimilėjau', 'įsimylėjau', '', 'ACCEPTED'),
(238, 'įpač', 'ypač', '', 'ACCEPTED'),
(239, 'įpatingas', 'ypatingas', '', 'ACCEPTED'),
(240, 'problma', 'problema', '', 'UNDECIDED'),
(241, 'problmos', 'problemos', '', 'UNDECIDED'),
(242, 'problmai', 'problemai', '', 'UNDECIDED'),
(243, 'problmą', 'problemą', '', 'UNDECIDED'),
(244, 'problmoje', 'problemoje', '', 'UNDECIDED'),
(246, '---', '—', 'Trys minusai → ilgesnis brūkšnys. Tačiau VLKK konsultantai teigia, kad šis simbolis lietuvių kalboje nevartotinas...', 'ACCEPTED'),
(247, 'gal būt', 'galbūt', '', 'ACCEPTED'),
(248, '  ', ' ', 'Du tarpai keičiami vienu. Bet „OpenOffice.org“ tarpų „prastinimo“ funkciją ir taip turi.', 'ACCEPTED'),
(249, '\'\'', '“', 'Du apostrofai → uždarančioji kabutė. Bijau, jog tai šiek tiek rizikinga.', 'ACCEPTED'),
(251, 'nros', 'nors', '', 'ACCEPTED'),
(252, 'jū', 'jų', '', 'ACCEPTED'),
(253, 'neišdeks', 'neišdegs', '', 'ACCEPTED'),
(254, 'išdeks', 'išdegs', '', 'ACCEPTED'),
(255, 'kuom', 'kuo', '', 'ACCEPTED'),
(256, 'atsikrenksčiau', 'atsikrenkščiau', 'Per retas žodis', 'REJECTED'),
(257, 'krupteliu', 'krūpteliu', 'Gramatikos klaida, per daug formų, per retas žodis', 'REJECTED'),
(258, 'krupteli', 'krūpteli', 'Gramatikos klaida, per daug formų, per retas žodis', 'REJECTED'),
(259, 'kruptelime', 'krūptelime', 'Gramatikos klaida, per daug formų, per retas žodis', 'REJECTED'),
(260, 'kruptelite', 'krūptelite', 'Gramatikos klaida, per daug formų, per retas žodis', 'REJECTED'),
(261, 'kruptelėjimas', 'krūptelėjimas', 'Gramatikos klaida, per daug formų, per retas žodis', 'REJECTED'),
(262, 'no', 'nuo', '', 'UNDECIDED'),
(263, 'įsijuosusi', 'išsijuosusi', '', 'ACCEPTED'),
(264, 'įsijuosęs', 'išsijuosęs', '', 'ACCEPTED'),
(265, 'įsijuosus', 'išsijuosus', '', 'ACCEPTED'),
(266, 'mynutės', 'minutės', '', 'REJECTED'),
(267, 'įšniukštinėjo', 'iššniukštinėjo', 'Gramatikos klaida, per daug formų, retas žodis', 'REJECTED'),
(268, 'tyrūs', 'tyri', '', 'UNDECIDED'),
(269, 'pastabėti', 'pastebėti', '', 'UNDECIDED'),
(270, 'palėčiau', 'paliečiau', 'Gramatikos klaida, per daug formų', 'UNDECIDED'),
(536, 'vokti', 'vogti', '', 'UNDECIDED'),
(534, 'tanpa', 'tampa', '', 'UNDECIDED'),
(275, 'nustebintį', 'nustebinti', '', 'UNDECIDED'),
(276, 'iš ties', 'išties', '', 'ACCEPTED'),
(277, 'vsikas', 'viskas', '', 'ACCEPTED'),
(278, 'bučiau', 'būčiau', '', 'ACCEPTED'),
(279, 'įsiremusi', 'įsirėmusi', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(280, 'ysiremusi', 'įsirėmusi', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(281, 'palnuoti', 'planuoti', '', 'ACCEPTED'),
(282, 'vis dėl to', 'vis dėlto', '', 'ACCEPTED'),
(283, 'kiap', 'kaip', '', 'ACCEPTED'),
(284, 'skendėtu', 'skendėtų', '', 'UNDECIDED'),
(285, 'svarščiau', 'svarsčiau', '', 'UNDECIDED'),
(286, 'jieškoti', 'ieškoti', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(287, 'ubutnu', 'ubuntu', '', 'UNDECIDED'),
(288, 'Kalipėda', 'Klaipėda', '', 'ACCEPTED'),
(289, 'čai', 'čia', '', 'ACCEPTED'),
(290, 'debina', 'debian', '', 'REJECTED'),
(291, 'ideti', 'įdėti', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(292, 'idwti', 'įdėti', '„Ė“ ir „W“ nėra gretimi klavišai, ar tikrai jie dažnai painiojami?', 'REJECTED'),
(293, 'omg', 'dievulėliau', 'Velykų siurprizas :)', 'UNDECIDED'),
(294, 'batarėja', 'baterija', 'Gramatikos klaida, daug formų', 'REJECTED'),
(295, 'viska', 'viską', '', 'UNDECIDED'),
(296, 'anklodė', 'antklodė', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(297, 'etn', 'ten', '', 'ACCEPTED'),
(298, 'ipatingai', 'ypatingai', '', 'ACCEPTED'),
(299, 'įpatingai', 'ypatingai', '', 'ACCEPTED'),
(300, 'susypažins', 'susipažins', '', 'UNDECIDED'),
(301, 'turių', 'turiu', '', 'UNDECIDED'),
(302, 'toki', 'tokį', '', 'UNDECIDED'),
(303, 'glosnis', 'gluosnis', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(531, 'nuspręndę', 'nusprendę', '', 'UNDECIDED'),
(530, 'nuspręndė', 'nusprendė', '', 'UNDECIDED'),
(529, 'nedelsent', 'nedelsiant', '', 'UNDECIDED'),
(528, 'kordinatorius', 'koordinatorius', '', 'UNDECIDED'),
(309, 'kvepainčiais', 'kvepiančiais', '', 'UNDECIDED'),
(310, 'kvepenčiais', 'kvepiančiais', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(311, 'kvepe', 'kvepia', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(312, 'reiktu', 'reiktų', '', 'UNDECIDED'),
(313, 'virtinos', 'vitrinos', '', 'UNDECIDED'),
(314, 'pasėkmė', 'pasekmė', '', 'ACCEPTED'),
(315, 'pasėkmes', 'pasekmes', '', 'ACCEPTED'),
(316, 'sekes', 'sekęs', '', 'UNDECIDED'),
(317, 'rybų', 'ribų', '', 'UNDECIDED'),
(318, 'ryba', 'riba', '', 'UNDECIDED'),
(319, 'rybos', 'ribos', '', 'UNDECIDED'),
(320, 'rybai', 'ribai', '', 'UNDECIDED'),
(321, 'rybą', 'ribą', '', 'UNDECIDED'),
(322, 'ryboje', 'riboje', '', 'UNDECIDED'),
(323, 'kakata', 'kakta', 'Ar ši klaida dažna?', 'UNDECIDED'),
(324, 'kakatos', 'kaktos', 'Ar ši klaida dažna?', 'UNDECIDED'),
(325, 'riebū', 'riebų', '', 'UNDECIDED'),
(326, 'grįštu', 'grįžtu', 'Gramatikos klaida, per daug formų', 'UNDECIDED'),
(327, 'gryžtu', 'grįžtu', '', 'UNDECIDED'),
(328, 'ora', 'orą', '', 'UNDECIDED'),
(329, 'pamirųti', 'pamiršti', '', 'ACCEPTED'),
(330, 'autmobilis', 'automobilis', 'Vargu, ar dažna klaida', 'REJECTED'),
(331, 'palėtė', 'paletė', 'Gali būti ir klaidingai užrašytas veiksmažodis „palietė“', 'REJECTED'),
(333, 'yrodyta', 'įrodyta', '', 'UNDECIDED'),
(334, 'yranga', 'įranga', '', 'UNDECIDED'),
(335, 'pasakiai', 'pasakei', '', 'UNDECIDED'),
(336, 'skyniai', 'skynei', '', 'UNDECIDED'),
(337, 'jug', 'juk', '', 'ACCEPTED'),
(338, 'persisiūsti', 'persisiųsti', '', 'UNDECIDED'),
(339, 'persiūsti', 'persiųsti', '', 'UNDECIDED'),
(340, 'pvz', 'pvz.', '', 'UNDECIDED'),
(341, 'vsio, poka', 'vis, iki', ';-)', 'REJECTED'),
(344, 'krųvis', 'krūvis', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(525, 'abėjonė', 'abejonė', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(524, 'abėjoti', 'abejoti', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(521, 'vėleva', 'vėliava', '', 'UNDECIDED'),
(349, 'veinas', 'vienas', '', 'ACCEPTED'),
(350, 'veiną', 'vieną', '', 'ACCEPTED'),
(351, 'gyvųnai', 'gyvūnai', 'Abejoju, ar dažna klaida', 'UNDECIDED'),
(352, 'poperių', 'popierių', '', 'UNDECIDED'),
(353, 'poperius', 'popierius', '', 'UNDECIDED'),
(354, 'poperiaus', 'popieriaus', '', 'UNDECIDED'),
(355, 'poperiui', 'popieriui', '', 'UNDECIDED'),
(356, 'poperiumi', 'popieriumi', '', 'UNDECIDED'),
(357, 'poperiau', 'popieriau', '', 'UNDECIDED'),
(358, 'vitirnos', 'vitrinos', '', 'UNDECIDED'),
(359, 'lesiti', 'leisti', '', 'UNDECIDED'),
(360, 'dėja', 'deja', '', 'ACCEPTED'),
(361, 'jaigu', 'jeigu', 'Ar ši klaida dažna?', 'UNDECIDED'),
(362, 'acpėti', 'atspėti', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(363, 'spyri', 'spyrį', '', 'UNDECIDED'),
(364, 'skraidimas', 'skraidymas', '', 'UNDECIDED'),
(365, 'akip', 'kaip', '', 'ACCEPTED'),
(366, 'aks', 'kas', '', 'ACCEPTED'),
(367, 'praščiausia', 'prasčiausia', '', 'UNDECIDED'),
(368, 'supakuotūmėte', 'supakuotumėte', '', 'UNDECIDED'),
(369, 'apskirtai', 'apskritai', '', 'ACCEPTED'),
(370, 'voks', 'vogs', '', 'UNDECIDED'),
(371, 'užkrėčia', 'užkrečia', '', 'UNDECIDED'),
(372, 'klausaiu', 'klausiau', '', 'ACCEPTED'),
(373, 'mąsiškai', 'masiškai', '', 'UNDECIDED'),
(374, 'męs', 'mes', '', 'UNDECIDED'),
(375, 'ginyba', 'gynyba', '', 'ACCEPTED'),
(376, 'kišianpinigiai', 'kišenpinigiai', 'Gramatikos klaida, per daug formų, per retas žodis', 'REJECTED'),
(518, 'sąliga', 'sąlyga', '', 'UNDECIDED'),
(378, 'abskritai', 'apskritai', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(379, 'beroc', 'berods', '', 'ACCEPTED'),
(380, 'nežine', 'nežinia', '', 'UNDECIDED'),
(381, 'najiena', 'naujiena', '', 'UNDECIDED'),
(382, 'acimenu', 'atsimenu', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(383, 'deugiau', 'daugiau', 'Vargu, ar dažna klaida', 'REJECTED'),
(384, 'tay', 'tai', '', 'UNDECIDED'),
(385, 'žinasi', 'žinias', '', 'UNDECIDED'),
(386, 'ideliai', 'idealiai', '', 'UNDECIDED'),
(387, 'idelei', 'idealiai', '', 'UNDECIDED'),
(388, 'nėsčia', 'nėščia', '', 'UNDECIDED'),
(389, 'gewrai', 'gerai', 'Abejoju, ar dažna klaida', 'UNDECIDED'),
(390, 'badlas', 'baldas', '', 'ACCEPTED'),
(391, 'badlai', 'baldai', '', 'ACCEPTED'),
(392, 'ankedotas', 'anekdotas', '', 'ACCEPTED'),
(393, 'specelystas', 'specialistas', '', 'UNDECIDED'),
(394, 'specelistas', 'specialistas', '', 'UNDECIDED'),
(395, 'niūnansas', 'niunansas', '', 'UNDECIDED'),
(396, 'panudoti', 'panaudoti', '', 'UNDECIDED'),
(397, 'pagrysti', 'pagrįsti', '', 'UNDECIDED'),
(398, 'tikiausiai', 'tikriausiai', '', 'UNDECIDED'),
(399, 'norėtūsi', 'norėtųsi', '', 'UNDECIDED'),
(516, 'salyga', 'sąlyga', '', 'UNDECIDED'),
(401, 'kolekcenuoti', 'kolekcionuoti', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(402, 'pirsidėti', 'prisidėti', '', 'UNDECIDED'),
(403, 'truakti', 'traukti', '', 'UNDECIDED'),
(404, 'realiefinis', 'reljefinis', '', 'UNDECIDED'),
(405, 'realiefas', 'reljefas', '', 'UNDECIDED'),
(406, 'sugerenčio', 'sugeriančio', '', 'UNDECIDED'),
(407, 'sugerentys', 'sugeriantys', '', 'UNDECIDED'),
(408, 'atceit', 'atseit', '', 'ACCEPTED'),
(409, 'daigtas', 'daiktas', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(410, 'kaška', 'kažką', '', 'REJECTED'),
(411, 'gražiia', 'gražiai', '', 'ACCEPTED'),
(412, 'jatrų', 'jautrų', 'Ar ši klaida dažna?', 'UNDECIDED'),
(413, 'nepatinak', 'nepatinka', '', 'ACCEPTED'),
(414, 'koficienta', 'koeficientą', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(415, 'tuolete', 'tualete', '', 'UNDECIDED'),
(416, 'genelus', 'genealus', 'Gramatikos klaida, per daug formų', 'UNDECIDED'),
(418, 'inicetyva', 'iniciatyva', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(419, 'atisrado', 'atsirado', '', 'ACCEPTED'),
(420, 'glaima', 'galima', '', 'ACCEPTED'),
(421, 'pagrysta', 'pagrįsta', '', 'UNDECIDED'),
(514, 'Aktivuoti', 'Aktyvuoti', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(423, 'konpetentingas', 'kompetentingas', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(424, 'kury', 'kurį', '', 'UNDECIDED'),
(425, 'priežaščių', 'priežasčių', '', 'UNDECIDED'),
(426, 'abgailėtina', 'apgailėtina', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(427, 'vakumas', 'vakuumas', '', 'ACCEPTED'),
(428, 'problėmėlė', 'problemėlė', '', 'UNDECIDED'),
(429, 'tikrūjų', 'tikrųjų', '', 'ACCEPTED'),
(430, 'lygys', 'lygis', '', 'UNDECIDED'),
(431, 'skubei', 'skubiai', '', 'UNDECIDED'),
(432, 'pavogia', 'pavagia', '', 'ACCEPTED'),
(433, 'apledyja', 'apledija', 'Nėr garantijos, kad čia neturės būti „aplediję“', 'REJECTED'),
(434, 'apledyję', 'aplediję', '', 'ACCEPTED'),
(435, 'pencija', 'pensija', '', 'ACCEPTED'),
(436, 'suagus', 'suaugus', '', 'UNDECIDED'),
(437, 'sencoriai', 'sensoriai', '', 'UNDECIDED'),
(438, 'straispnių', 'straipsnių', '', 'ACCEPTED'),
(439, 'sluosnis', 'sluoksnis', '', 'UNDECIDED'),
(440, 'nežianu', 'nežinau', '', 'ACCEPTED'),
(441, 'vėžias', 'vėžes', '', 'ACCEPTED'),
(442, 'kalusimas', 'klausimas', '', 'ACCEPTED'),
(443, 'skedavosi', 'sekdavosi', '', 'UNDECIDED'),
(444, 'nuajoje', 'naujoje', '', 'ACCEPTED'),
(445, 'sudekti', 'sudegti', '', 'ACCEPTED'),
(446, 'suderkti', 'sudergti', '', 'UNDECIDED'),
(447, 'klįsti', 'klysti', 'Ar tai dažna klaida?', 'UNDECIDED'),
(448, 'geremo', 'geriamo', 'Gramatikos klaida, per daug formų', 'UNDECIDED'),
(449, 'alchoholio', 'alkoholio', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(450, 'laiakisi', 'laikaisi', '', 'ACCEPTED'),
(451, 'atvėjas', 'atvejas', 'Gramatikos klaida, daug formų', 'UNDECIDED'),
(452, 'nepralydis', 'nepralydys', 'Gramatikos klaida, per retas žodis', 'UNDECIDED'),
(453, 'įtin', 'itin', '', 'ACCEPTED'),
(454, 'neštumas', 'nėštumas', '', 'UNDECIDED'),
(455, 'indžinerija', 'inžinerija', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(456, 'šian', 'šen', '', 'UNDECIDED'),
(457, 'pavizdį', 'pavyzdį', '', 'UNDECIDED'),
(458, 'pavizdys', 'pavyzdys', '', 'UNDECIDED'),
(459, 'palčiau', 'plačiau', '', 'ACCEPTED'),
(460, 'išdėščiau', 'išdėsčiau', '', 'REJECTED'),
(461, 'dūjų', 'dujų', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(462, 'nesigėdyja', 'nesigėdija', '', 'UNDECIDED'),
(463, 'klavetūra', 'klaviatūra', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(464, 'žinksnius', 'žingsnius', '', 'UNDECIDED'),
(465, 'anegdotas', 'anekdotas', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(466, 'ydome', 'įdomią', 'Visgi ekstremalaus neraštingumo problemą reikia spręsti kitaip', 'REJECTED'),
(467, 'paneiktų', 'paneigtų', '', 'ACCEPTED'),
(468, 'šancą', 'šansą', '', 'UNDECIDED'),
(469, 'šancas', 'šansas', '', 'UNDECIDED'),
(470, 'papraščiausiai', 'paprasčiausiai', '', 'ACCEPTED'),
(471, 'akrto', 'karto', '', 'ACCEPTED'),
(472, 'amnęs', 'manęs', '', 'ACCEPTED'),
(473, 'asiminimai', 'atsiminimai', 'Vargu, ar dažna klaida', 'REJECTED'),
(474, 'trancliuoti', 'transliuoti', '', 'UNDECIDED'),
(475, 'vijasi', 'vejasi', '', 'UNDECIDED'),
(476, 'piratvaimo', 'piratavimo', '', 'UNDECIDED'),
(477, 'mokeščių', 'mokesčių', 'Gramatikos klaida, daug formų', 'UNDECIDED'),
(478, 'grejtėti', 'greitėti', 'Gramatikos klaida, per daug formų', 'UNDECIDED'),
(479, 'patrnaka', 'patranka', '', 'ACCEPTED'),
(480, 'ekspermentas', 'eksperimentas', '', 'ACCEPTED'),
(481, 'skūstųsi', 'skųstųsi', '', 'UNDECIDED'),
(482, 'šiokę', 'šiokią', '', 'UNDECIDED'),
(483, 'parsisiūs', 'parsisiųs', '', 'ACCEPTED'),
(484, 'dyrbsim', 'dirbsim', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(485, 'dyrbam', 'dirbam', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(486, 'dyrba', 'dirba', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(487, 'užgniauštas', 'užgniaužtas', '', 'UNDECIDED'),
(488, 'pylna', 'pilna', '', 'UNDECIDED'),
(489, 'pėščiomis', 'pėsčiomis', '', 'UNDECIDED'),
(490, 'ugnesienė', 'ugniasienė', '', 'UNDECIDED'),
(491, 'vintiletorius', 'ventiliatorius', '', 'UNDECIDED'),
(492, 'tričiųjų', 'trečiųjų', '', 'UNDECIDED'),
(493, 'treičiųjų', 'trečiųjų', '', 'UNDECIDED'),
(494, 'neoficeliu', 'neoficialiu', 'Gramatikos klaida, daug formų', 'REJECTED'),
(495, 'oficeliu', 'oficialiu', 'Gramatikos klaida, daug formų', 'REJECTED'),
(496, 'atsimęnu', 'atsimenu', '', 'REJECTED'),
(497, 'apsurdas', 'absurdas', 'Gramatikos klaida, daug formų', 'REJECTED'),
(498, 'gynčytis', 'ginčytis', 'Gramatikos klaida, per daug formų', 'UNDECIDED'),
(499, 'šildimas', 'šildymas', '', 'UNDECIDED'),
(500, 'pažimys', 'pažymys', '', 'ACCEPTED'),
(501, 'idijotas', 'idiotas', '', 'ACCEPTED'),
(502, 'varijantas', 'variantas', '', 'ACCEPTED'),
(503, 'būri', 'buri', 'Gali būti ir „būrį“', 'REJECTED'),
(504, 'pasaulije', 'pasaulyje', '', 'UNDECIDED'),
(505, 'vyksenčias', 'vyksiančias', '', 'UNDECIDED'),
(506, 'persijunktu', 'persijungtu', '', 'UNDECIDED'),
(507, 'gražei', 'gražiai', '', 'UNDECIDED'),
(508, 'populerus', 'populiarus', '', 'UNDECIDED'),
(509, 'didžeuses', 'didžiausias', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(510, 'įrodynėti', 'įrodinėti', '', 'UNDECIDED'),
(511, 'Lietuvoi', 'Lietuvoj', '', 'UNDECIDED'),
(535, 'įšorė', 'išorė', '', 'UNDECIDED'),
(533, 'pinygai', 'pinigai', '', 'UNDECIDED'),
(541, 'vystikluose', 'vystykluose', '', 'UNDECIDED'),
(542, 'labao', 'labai', '', 'UNDECIDED'),
(538, 'siunčiua', 'siunčiau', '', 'UNDECIDED'),
(537, 'šelionės', 'šėlionės', '', 'UNDECIDED'),
(526, 'baigit', 'baikit', '', 'UNDECIDED'),
(527, 'diean', 'diena', '', 'ACCEPTED'),
(552, 'nenukentėtūm', 'nenukentėtum', '', 'UNDECIDED'),
(517, 'saliga', 'sąlyga', '', 'UNDECIDED'),
(515, 'žemėsnės', 'žemesnės', '', 'UNDECIDED'),
(513, 'Aktivavimas', 'Aktyvavimas', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(522, 'tranclecijos', 'transliacijos', '', 'UNDECIDED'),
(523, 'dryščiau', 'drįsčiau', '', 'REJECTED'),
(519, 'aceit', 'atseit', '', 'ACCEPTED'),
(520, 'trigdo', 'trikdo', '', 'UNDECIDED'),
(550, 'degradatcija', 'degradacija', '', 'REJECTED'),
(547, 'faniera', 'fanera', '', 'UNDECIDED'),
(544, 'sukurys', 'sūkurys', '', 'UNDECIDED'),
(532, 'perliankiama', 'perlenkiama', '', 'UNDECIDED'),
(556, 'jungentys', 'jungiantys', '', 'UNDECIDED'),
(557, 'pažimėti', 'pažymėti', '', 'UNDECIDED'),
(558, 'niera', 'nėra', '', 'UNDECIDED'),
(559, 'žynomas', 'žinomas', '', 'REJECTED'),
(560, 'disinformacij', 'dezinformacija', '', 'REJECTED'),
(561, 'desinformacija', 'dezinformacija', '', 'UNDECIDED'),
(562, 'junktis', 'jungtis', '', 'UNDECIDED'),
(563, 'vygdavo', 'vykdavo', '', 'UNDECIDED'),
(564, 'būnų', 'būnu', '', 'REJECTED'),
(565, 'kėkvienas', 'kiekvienas', '', 'UNDECIDED'),
(566, 'specelybė', 'specialybė', '', 'UNDECIDED'),
(567, 'dideliai', 'didelei', '', 'ACCEPTED'),
(568, 'givatė', 'gyvatė', '', 'UNDECIDED'),
(569, 'išprūsimas', 'išprusimas', '', 'UNDECIDED'),
(570, 'mūtuoti', 'mutuoti', '', 'UNDECIDED'),
(571, 'išradymas', 'išradimas', '', 'UNDECIDED'),
(572, 'paslpėti', 'paslėpti', '', 'UNDECIDED'),
(573, 'išvystitas', 'išvystytas', '', 'UNDECIDED'),
(574, 'kekvienas', 'kiekvienas', '', 'UNDECIDED'),
(575, 'plasmasė', 'plastmasė', '', 'UNDECIDED'),
(576, 'plasmasinis', 'plastmasinis', '', 'UNDECIDED'),
(577, 'tetras', 'teatras', '', 'UNDECIDED'),
(578, 'tętras', 'teatras', '', 'UNDECIDED'),
(579, 'vintiliatorius', 'ventiliatorius', '', 'UNDECIDED'),
(580, 'vintilis', 'ventilis', '', 'UNDECIDED'),
(581, 'egojizmas', 'egoizmas', '', 'UNDECIDED'),
(582, 'properelis', 'propeleris', '', 'UNDECIDED'),
(583, 'properelinis', 'propelerinis', '', 'UNDECIDED'),
(584, 'sheip', 'šiaip', '', 'UNDECIDED'),
(585, 'prelimenarus', 'preliminarus', '', 'UNDECIDED'),
(586, 'prelimenariai', 'preliminariai', '', 'UNDECIDED'),
(587, 'pasaulija', 'pasaulyje', '', 'UNDECIDED'),
(588, 'kila', 'kyla', '', 'UNDECIDED'),
(589, 'gyliausias', 'giliausias', '', 'UNDECIDED'),
(590, 'ję', 'ją', '', 'UNDECIDED'),
(591, 'kašką', 'kažką', '', 'UNDECIDED'),
(592, 'nuruoda', 'nuoroda', '', 'UNDECIDED'),
(593, 'tokiaj', 'tokiai', '', 'UNDECIDED'),
(594, 'daugialis', 'daugelis', 'Gramatikos klaida, daug formų', 'REJECTED'),
(595, 'givenymus', 'gyvenimus', '', 'UNDECIDED'),
(596, 'ygivendintas', 'įgyvendintas', '', 'UNDECIDED'),
(597, 'gla', 'gal', '', 'UNDECIDED'),
(598, 'gydimas', 'gydymas', '', 'UNDECIDED'),
(599, 'praščiau', 'prasčiau', '', 'UNDECIDED'),
(600, 'vakarieniai', 'vakarienei', '', 'UNDECIDED'),
(601, 'regulevimas', 'reguliavimas', '', 'UNDECIDED'),
(602, 'sviruoja', 'svyruoja', '', 'UNDECIDED'),
(603, 'pjūvenos', 'pjuvenos', '', 'UNDECIDED'),
(604, 'balancuota', 'balansuota', 'Gramatikos klaida, daug formų', 'UNDECIDED'),
(605, 'taturuotė', 'tatuiruotė', '', 'UNDECIDED'),
(606, 'komlpektas', 'komplektas', '', 'UNDECIDED'),
(607, 'tatiruotė', 'tatuiruotė', '', 'UNDECIDED'),
(608, 'komapanija', 'kompanija', '', 'UNDECIDED'),
(609, 'keliatas', 'keletas', '', 'UNDECIDED'),
(610, 'išjungiai', 'išjungei', '', 'UNDECIDED'),
(611, 'žurnalia', 'žurnale', '', 'REJECTED'),
(612, 'runktynės', 'rungtynės', '', 'UNDECIDED'),
(613, 'psiaudo', 'pseudo', '', 'UNDECIDED'),
(614, 'dalyksa', 'dalykas', '', 'UNDECIDED'),
(615, 'taij', 'tai', '', 'UNDECIDED'),
(616, 'keles', 'kelias', '', 'UNDECIDED'),
(617, 'tosk', 'toks', '', 'UNDECIDED'),
(618, 'energyja', 'energija', '', 'UNDECIDED'),
(619, 'realetyvus', 'reliatyvus', '', 'UNDECIDED'),
(620, 'realetyvumo', 'reliatyvumo', '', 'UNDECIDED'),
(621, 'pavarks', 'pavargs', '', 'UNDECIDED'),
(622, 'translecija', 'transliacija', '', 'UNDECIDED'),
(623, 'drekinti', 'drėkinti', '', 'REJECTED'),
(624, 'duomėn', 'domėn', '', 'UNDECIDED'),
(625, 'aštunkojis', 'aštuonkojis', 'Gramatikos klaida, daug formų', 'UNDECIDED'),
(626, 'ęsamą', 'esamą', '', 'UNDECIDED'),
(627, 'didialiam', 'dideliam', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(628, 'didialiame', 'dideliame', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(629, 'didialiems', 'dideliems', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(630, 'suparto', 'suprato', '', 'UNDECIDED'),
(631, 'domėjasis', 'domėjęsis', '', 'UNDECIDED'),
(632, 'vaakr', 'vakar', '', 'UNDECIDED'),
(633, 'vygdyti', 'vykdyti', '', 'UNDECIDED'),
(634, 'deagrama', 'diagrama', 'Gramatikos klaida, daug formų', 'REJECTED'),
(635, 'keliatą', 'keletą', '', 'UNDECIDED'),
(636, 'visma', 'visam', '', 'UNDECIDED'),
(637, 'norėją', 'norėję', '', 'UNDECIDED'),
(638, 'reikai', 'reikia', '', 'UNDECIDED'),
(639, 'liame', 'lemia', '', 'UNDECIDED'),
(640, 'yvartis', 'įvartis', '', 'UNDECIDED'),
(641, 'primynti', 'priminti', '', 'UNDECIDED'),
(642, 'įgivendinti', 'įgyvendinti', '', 'UNDECIDED'),
(643, 'orandžinis', 'oranžinis', '', 'UNDECIDED'),
(644, 'liopardas', 'leopardas', '', 'UNDECIDED'),
(645, 'gyvūlys', 'gyvulys', '', 'UNDECIDED'),
(646, 'atvėjis', 'atvejis', 'Gramatikos klaida, daug formų', 'UNDECIDED'),
(647, 'vsio', 'viskas, iki', '', 'REJECTED'),
(648, 'vsio, poka', 'viskas, iki', '', 'REJECTED'),
(649, 'vsio', 'iš viso', 'viso - rusiškas pažodinis žodis', 'REJECTED'),
(650, 'vsio', 'gana', '', 'REJECTED'),
(651, 'mastai', 'mastai', '', 'UNDECIDED'),
(652, 'persijunktu', 'persijungtų', '', 'UNDECIDED'),
(653, 'suagus', 'saugus', '', 'UNDECIDED'),
(654, 'tirka', 'tikra', '', 'UNDECIDED'),
(655, 'smarkei', 'smarkiai', '', 'UNDECIDED'),
(656, 'diakto', 'daikto', '', 'UNDECIDED'),
(657, 'nesiriame', 'nesiremia', '', 'UNDECIDED'),
(658, 'nuopolis', 'nuopuolis', '', 'UNDECIDED'),
(659, 'balancas', 'balansas', 'Gramatikos klaida, daug formų', 'UNDECIDED'),
(660, 'balancuoti', 'balansuoti', 'Gramatikos klaida, daug formų', 'UNDECIDED'),
(661, 'pokytčiui', 'pokyčiui', '', 'UNDECIDED'),
(662, 'pokytčiai', 'pokyčiai', '', 'UNDECIDED'),
(663, 'pokytčiams', 'pokyčiams', '', 'UNDECIDED'),
(664, 'vygdo', 'vykdo', '', 'UNDECIDED'),
(665, 'vygdomasis', 'vykdomasis', '', 'UNDECIDED'),
(666, 'givybė', 'gyvybė', '', 'UNDECIDED'),
(667, 'givybių', 'gyvybių', '', 'UNDECIDED'),
(668, 'givybei', 'gyvybei', '', 'UNDECIDED'),
(669, 'regulerei', 'reguliariai', '', 'UNDECIDED'),
(670, 'pavizdys', 'pavydys', '', 'UNDECIDED'),
(671, 'papraščiausios', 'paprasčiausios', '', 'UNDECIDED'),
(672, 'negaisčiau', 'negaiščiau', '', 'UNDECIDED'),
(673, 'gaisčiau', 'gaiščiau', '', 'UNDECIDED'),
(674, 'praporcija', 'proporcija', '', 'UNDECIDED'),
(675, 'praporcijos', 'proporcijos', '', 'UNDECIDED'),
(676, 'nesimatis', 'nesimatys', '', 'UNDECIDED'),
(677, 'bagstelti', 'bakstelti', 'Gramatikos klaida, daug formų', 'REJECTED'),
(678, 'čiuožikla', 'čiuožykla', 'Gramatikos klaida, per daug formų', 'REJECTED'),
(679, 'kiekije', 'kiekyje', '', 'UNDECIDED'),
(680, 'kurybingumas', 'kūrybingumas', '', 'UNDECIDED'),
(681, 'kūribingumas', 'kūrybingumas', '', 'UNDECIDED'),
(682, 'kuriba', 'kūryba', '', 'UNDECIDED'),
(683, 'kūriba', 'kūryba', '', 'UNDECIDED'),
(684, 'kazdien', 'kasdien', '', 'UNDECIDED'),
(685, 'arbuzas', 'arbūzas', 'Gramatikos klaida, daug formų', 'REJECTED'),
(686, 'šiou', 'šiuo', '', 'UNDECIDED'),
(687, 'jura', 'jūra', '', 'UNDECIDED'),
(688, 'šejp', 'šiaip', '', 'UNDECIDED'),
(689, 'įpatumas', 'ypatumas', '', 'UNDECIDED'),
(690, 'ipatumas', 'ypatumas', '', 'UNDECIDED'),
(691, 'įpatūmas', 'ypatumas', '', 'UNDECIDED'),
(692, 'ipatūmas', 'ypatumas', '', 'UNDECIDED'),
(693, 'ypatūmas', 'ypatumas', '', 'UNDECIDED'),
(694, 'basejnas', 'baseinas', 'Gramatikos klaida, daug formų', 'REJECTED'),
(695, 'konvėjeris', 'konvejeris', '', 'UNDECIDED'),
(696, 'egzamenai', 'egzaminai', '', 'UNDECIDED'),
(697, 'egzamenas', 'egzaminas', '', 'UNDECIDED'),
(698, 'ekzamenas', 'egzaminas', '', 'UNDECIDED'),
(699, 'ekzaminas', 'egzaminas', '', 'UNDECIDED'),
(700, 'ekzaminai', 'egzaminai', '', 'UNDECIDED'),
(701, 'babtistai', 'baptistai', '', 'UNDECIDED'),
(702, 'mokynys', 'mokinys', '', 'UNDECIDED'),
(703, 'mokynė', 'mokinė', '', 'UNDECIDED'),
(704, 'mokikla', 'mokykla', '', 'UNDECIDED'),
(705, 'mokitojas', 'mokytojas', '', 'UNDECIDED'),
(706, 'mokitoja', 'mokytoja', '', 'UNDECIDED'),
(707, 'rigi', 'irgi', '', 'UNDECIDED'),
(708, 'apskui', 'paskui', '', 'ACCEPTED'),
(709, 'Lamerškas', 'Lameriškas', 'nevykėliškas programišiušiškai', 'UNDECIDED'),
(710, 'lameršikas', 'lameriškas', '', 'UNDECIDED'),
(711, 'šendien', 'šiandien', '', 'UNDECIDED'),
(712, 'Suįrančios', 'Suyrančios', '', 'UNDECIDED'),
(713, 'potrumpes kelnias', 'potrumpas kelnias', '', 'UNDECIDED'),
(714, 'pripažysta', 'pripažįsta', '', 'UNDECIDED');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(30) COLLATE utf8_lithuanian_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL,
  `password` varchar(48) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Sukurta duomenų kopija lentelei `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `email`, `password`) VALUES
    (1, 'user', 'Example user', 'user@example.org', '$1$yWYz5pu7$aInPfkAxJi/pyNWY2nrvf1'); -- hash for 'password'
--
-- Indexes for dumped tables
--

--
-- Indexes for table `documentList`
--
ALTER TABLE `documentList`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `documentList`
--
ALTER TABLE `documentList`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1225;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;