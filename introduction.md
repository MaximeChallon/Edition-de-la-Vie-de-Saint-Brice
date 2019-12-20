# Objectifs de l'édition à visée paléographique du manuscrit 411 de la Bibliothèque nationale de France

* Présenter une transcription fidèle au texte
* Pouvoir présenter en parallèle une transcription normalisée tant pour la graphie que pour le développement des abréviations et les corrections apportées
* Etablir un index des noms de lieux et de personnages
* Donner à chaque partie sa position sur l'image
* Décrire la mise en page
* Indiquer la présence des initiales ornées ainsi que des subdivisions du manuscrit: rubrication, pieds de mouche, fins de lignes, majuscules, etc

# Solutions d'encodage en réponse aux objectifs de l'édition

* Utilisation de la fonte de caractères Palemonas MUFI convenant aux écritures manuscrites médiévales : chaque caractère pris dans cette fonte sera intégré dans le XML selon sa valeur décimale
* Utilisation de la balise `<choice>` accompagnée de `<orig>` et `<reg>` pour les régularisations de graphie
* Utilisation de la balise `<choice>` accompagnée de `<abbr>` et `<expan>` pour les développements d'abréviations
* Utilisation de la balise `<choice>` accompagnée de `<sic>` et `<corr>` pour les corrections
* Création d'une DTD externe pour déclarer les éntités, sous la forme `<!ENTITY nom "<choice><abbr>&#xxxxx;</abbr><expan>y</expan></choice>" > `
* Création d'index dans le teiHeader de manière à encoder chaque lieu et personne du texte
* Utilisation du teiZoner pour délimiter les zones de l'image de manière à encoder le texte à l'intérieur de ces zones
* Déclaration des images dans `<facsimile><surface><graphic url='adresse_image' width='largeur' height='longueur'/><zone xml:id="" ulx="" uly="" lrx="" lry=""/></surface></facsimile>`
* Utilisation de `<cb>`, `<pb>` et `<lb>` pour décrire la mise en page du texte
* Utilisation de la balise `<seg>` pour le texte de chaque intiale ornée présente ou absente, et de la balise `<p>` pour délimiter les parties distinguables par leur initiale à l'intérieur de ces `<seg>`
* La section `<msContents>` sera remplie de toutes les vies de saints du manuscrit (avec les balises `<msItemStruct>`), et non seulement de celle de Saint-Gilles, pour le cas d'une édition complète du manuscrit, ainsi que pour situer la vie de Saint-Gilles dans son environnement

# Exploitations possibles de l'encodage

* Edition numérique du texte basée sur l'image pour une lecture interactive du manuscrit
* A partir des index:
    * établissement sur l'édition numérique de "cartes d'identité" de chaque lieu et personnage au survol de la souris
    * établissement d'un index génral renvoyant aux endroits de citation de l'élément d'index
* Edition numérique de deux textes:
    * le texte tel qu'il est présent sur le manuscrit
    * le texte rétablit avec la bonne graphie et les abréviations développées
