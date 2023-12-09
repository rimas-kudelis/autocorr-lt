# Lietuviškas automatinio taisymo žodynas

Šioje saugykloje rasite pasiūlymus laisvajam lietuviškam automatinio taisymo (angl. „AutoCorrect“) žodynui, nuo 2009 m.
surinktus svetainėje `autocorr.akl.lt`, ir šios svetainės programinį kodą.

Projekto sumanymas buvo sukurti laisvajam platinimui tinkamą visavertį lietuviško automatinio taisymo žodyną.
Tokiame žodyne turėtų gyventi būti tokios poros, kaip antai:
- akd → kad
- agl → gal
- apei → apie

Surinkus akivaizdžiausias poras, iš jų buvo sugeneruoti žodynai [„OpenOffice“][1] ir [„LibreOffice“][2] biuro programų
paketams bei laisvajai „Android“ ekraninei klaviatūrai [„AnySoftKeyboard“][3]. Deja, daugėjant siūlymų, ėmė daugėti
ir abejonių dėl to, kuriuos žodžius verta, o kurių neverta traukti į šį žodyną. Kadangi lietuvių kalba linksniuojama,
asmenuojama, priešdėliuojama ir visaip kitaip kaitoma, ėmė darytis aišku, kad, norint padengti net ir akivaizdžias ir
vienareikšmiškai ištaisomas klaidas, žodyno apimtis grėstų nevaldomai augti, taip potencialiai lėtindama jį
naudojančių programų darbą, taigi, taisomas klaidas reikia kruopščiai atrinkinėti. Kadangi gerų formalių kriterijų
tokiai atrankai nesugalvojau, vėliau jau pateiktų žodynų nebenaujinau.

O dabar nusprendžiau, jog nebeverta laikyti ir pačios žodynų rinkimo svetainės: jos baisiai atrodantis kodas neliestas
jau gerokai virš 10 metų, pasiūlymų jau seniai niekas nebeteikia, o priimti konkrečių sprendimų dėl esamų pasiūlymų
irgi negaliu. Taigi, esamą svetainės kodą, duomenų bazės išklotinę dviem formatais ir pavyzdinius eksportuotus failus
nutariau tiesiog sudėti čia (atitinkamai: `src`, `data` ir `output` aplankuose). Jei kas norės šį darbą pratęsti, gal
čia ras ką nors naudingo.

# Lithuanian Autocorrect Dictionary

This repository holds the suggestions for a free (as in speech) Lithuanian autocorrect dictionary, which had been 
crowd-sourced from the visitors of `autocorr.akl.lt`, as well as the source code for this website.

The idea of this project was to build a versatile freely-distributable Lithuanian autocorrect dictionary. After sourcing
initial suggestions, I generated dictionaries for inclusion in [OpenOffice][1], [LibreOffice][2] and [AnySoftKeyboard][3].
However, as I began gathering further suggestions, it soon became apparent to me that overseeing this dictionary was no
easy task. Lithuanian words assume different forms depending on context, so to consistently fix even obvious mistakes
would require adding dozens of autocorrect definitions for each such mistake. I didn't want the dictionary to grow so
big that it would slow down applications using it, and didn't manage to come up with a satisfying criteria for
inclusion, so after making initial contributions, I never updated the dictionaries further. 

Now, more than a decade later, I decided to shut down the website as well. And this only seems fair, because its code is
hideous and outdated, there haven't been any new suggestions since I don't know when, and I find myself unable to
address even existing suggestions properly. Thus, I'm placing its source code, its database dump in two formats, and
both export files here (respectively, in `src`, `data` and `output` folders). Should anyone find anything useful here,
feel free to make use of it.

[1]: https://github.com/apache/openoffice/blob/trunk/main/extras/source/autotext/lang/lt-LT/acor_lt-LT.dat
[2]: https://github.com/LibreOffice/core/blob/master/extras/source/autocorr/lang/lt/DocumentList.xml
[3]: https://github.com/AnySoftKeyboard/AnySoftKeyboard/blob/main/addons/languages/lithuanian/pack/src/main/res/xml/lithuanian_autotext.xml