# VeyonScripts
simple batch files to install veyon on multiple computers

# Préambule :
Yo c’est N1C0.
C’est un tuto pour installer veyon sur plusieurs ordi depuis une clé sans se péter la tête et gagner du temps. J’ai essayé d’être le plus complet possible mais ce tuto est amené à évoluer vu que c’est rédigé n’importe comment, ça ne tient qu'à vous.
J’ai laissé mes fichiers de config pour que vous voyez à quoi ça ressemble. mais par pitié. SUPPRIMEZ LES ET  METTEZ LES VOTRES.
Si tu veux éviter le blabla j’ai mis les étapes importantes en gras
# Remerciement 
Je tiens à remercier Google, la doc Veyon et surtout mon G.O.D. sans qui rien de tout ça n'existerait.

# PRIMO INSTALL (MASTER)
Voici la vidéo que j’ai utilisé [Installing Veyon for Schools](https://www.youtube.com/watch?v=HrHJqdsCXUw).
Après avoir installé et configuré la version master via l’interface graphique sur le ou les pc principaux ( les pc master doivent avoir la même clé public et privée, pour allumer les pc a distance il faut mettre leur adresse MAC)
-	DANS GENERAL CHOISIR LA MÉTHODE D’AUTHENTIFICATION PAR CLÉ (à faire sur chaque poste si vous n’exportez pas la config)
-	créer la paire de clés public et privée
-	exporter la clé publique et la copier sur la clé usb
-	exporter la config et la copier sur la clé usb ( dans veyon configurator faire Fichier > Sauver les parametres dans un fichier )

Sur la clé usb à la racine ou dans le dossier il doit avoir les fichiers suivants :
-	les fichiers
    1-Unrestricted.bat,
    2-Veyon_Install_Silent_NoMaster.ps1,
    3-Veyon_Config.ps1 
    4-Restricted.bat
-	l’installation 64bits ou 32bits selon vos pc
-	la clé publique ( XXX_public_key.pem)
-	la config du master (myconfig.json)

# CONFIGURATION
## Editer le fichier 2-
met le setup qui te plait (64 ou 32 bits).
## Editer le fichier 3-
modifier $locat et mettre le nom de la salle que vous avez rentré dans le master.
modifier les variables pour que les noms de vos fichiers correspondent. 
Le chemin d’installation par défaut c’est C:\Program Files\Veyon\, à changer selon tes besoins.

Après plus besoin de modifier ces fichiers.

# INSTALLATION

## Exécuter le fichier 1- en admin
Il permet d'excuter des scripts en levant une restriction. On rétablit ce paramètre dans le fichier 2-

## Ouvrir powershell en tant qu’admin et Naviguer jusqu'à la clé ou dossier
( cd D:/ par exemple).
## Exécuter le fichier 2- 
### (tape ```.\2-Veyon_Install_Silent_NoMaster.ps1```  et fait entrer)
Ce script :
-	installe la version de Veyon de votre choix,
-	en silencieux /S,
-	sans le logiciel master “/nomaster” pour les pc “““esclaves”””. ( ce serait con que les élèves prennent le contrôle des autres pc).
L'installation est silencieuse, donc pas de fenêtre, rien à accepter. C’est rapide. C’est terminé quand tu peux de nouveau écrire dans le terminal ET que l'icône veyron apparaît en bas à droite avec les appli en arrière plan. 


## Ouvrir powershell en tant qu’admin. 
(ou utilisez la même fenetre admin powershell)
## Naviguer jusqu'à la clé ou dossier
( cd D:/ par exemple).
## Exécuter le fichier -3. 
### (tape ```.\3-Veyon_Config.ps1```  et fait entrer)
Ce script ajoute le nom de la salle où doit apparaître le pc, installe la config et la clé publique.

## Exécuter le fichier -4 en tant qu'admin.
Il sert à rétablir le blocage de scripts.

# Done
Et voilà c’est fini ! Ya plus qu’a répéter l’opération sur les autres pc.

Voici quelque lien utiles :

Une vidéo d’installation : [Installing Veyon for Schools](https://www.youtube.com/watch?v=HrHJqdsCXUw)

La documentation Veyon : [Veyon Documentation](https://docs.veyon.io/en/latest/)

Ton meilleur ami : [Google](https://www.google.com/)

Bonus : [BoNuS](https://www.youtube.com/watch?v=dQw4w9WgXcQ)

# MISC

## Export de la config
dans veyon configurator faire Fichier > Sauver les parametres dans un fichier


## Export des salles et des ordi
dans le dossier ou est installer veyon faire la commande :

``` .\veyon-cli.exe networkobjects export computers.csv format "%type%;%name%;%host%;%mac%" ```

## Import du fichier avec les salles et les ordi
dans cet exemple le fichier doit etre au format csv, le séparateur (;), la première ligne doit etre le premier ordi ET PAS LE NOM DES COLLONNES.
dans le dossier veyon faire la commande :

```.\veyon-cli.exe networkobjects import .\computers.csv format "%location%;%name%;%host%;%mac%" ```


# FAQ :
**Ça fonctionne sur quels OS ?**
> J’ai installé des pc windows 7 et windows 10. il ne devrait pas y avoir de pb pour Windows 11. Pas la peine d’essayer sur autre chose hein, c’est du POWERSHELL bordel. Pardon.

**Comment j'allume un pc à distance ?**
> il faut mettre son adresse MAC dans le configurateur

**Je peux copier les fichiers sur le pc et lancer les scripts ?**
>	Oui, assure-toi bien d’exécuter les scripts depuis le dossier ou sont les fichiers en mode administrateur. Tout doit être au même endroit.

**Comment je fais plusieurs pc master ?**
>	Tu installes la version master sur les pc avec la même paire clé publique et privée. Avec un nom de salle différent, c'est plus facile à gérer.

**Comment je fais apparaître les pc sur le master ?**
>	Il faut ajouter leur nom à la liste dans la bonne salle dans l’interface graphique. ( je l’ai fait à la mano le mec qui a nommé les pc avant moi c’était un roi. S’il vous faut un script pour le faire, faudra demander)

**Je peux mettre un pc dans plusieurs salles ?**
>	oui sans pb. tu met le nom du pc dans autant de salles que tu veux.


**C’est quoi le nom du pc ?**
>	tape la commande “hostname” dans le cmd du pc.

**J’ai deux pc avec le même nom je fais quoi ?**
>	Renomme un des pc. 

**On peut mettre l’IP du pc à la place ?**
>	Oui mais ca fonctionne mieu avec le hostname

**On peut changer le nom des fichiers ?**
> Oui, il suffit de changer les variables dans les scripts

**Comment faire apparaître la fenêtre d’installation ?**
>	Dans le fichier 1- retire le “/S”. Si tu fais ça pour changer le dossier d’installation, il faudra changer le chemin dans le fichier -2. Il doit bien avoir une commande pour choisir le dossier d’installation, ça fera partie des améliorations s’il y en a.

**Ton truc est codé avec le gros orteil gauche, je peux l’améliorer ?**
>	bien sûr faites ce que vous voulez. Si vous voulez contribuer je peux mettre tout ça sur GitHub pour les plus téméraires d’entre vous pour que tout le monde ai les dernières améliorations des scripts.

**T’as eu des problèmes lors de l’installation ?**
>	Pas dans les salles infos (46 postes sur 3 salles), mais au CDI (6pc)  j’ai eu un pb et j’ai dis FuckIt je verrais ça demain. ça fait 3 mois.

**C’est qui ton G.O.D.**
> Mon Gros Orteil Droit évidemment.
