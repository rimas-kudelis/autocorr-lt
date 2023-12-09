/* Funkcija, skirta dinamiškai pakeisti klasei nurodytą stilių. 
 * Tai pravartu daryti su, pvz., 'hidden' klase.
 */
function changeCSS(theClass,element,value) {
//documentation for this script at http://www.shawnolson.net/a/503/
	var cssRules;
	if (document.all) {
		cssRules = 'rules';
		}
	else if (document.getElementById) {
		cssRules = 'cssRules';
		}
	for (var S = 0; S < document.styleSheets.length; S++){
		for (var R = 0; R < document.styleSheets[S][cssRules].length; R++) {
			if (document.styleSheets[S][cssRules][R].selectorText == theClass) {
				document.styleSheets[S][cssRules][R].style[element] = value;
			}
		}
	}	
}
