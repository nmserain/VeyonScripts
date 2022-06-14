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
-	exporter la config et la copier sur la clé usb ( ca se fait en ligne de commande, faut que je la retrouve, là j’ai pas le net. c’est dans la doc de Veyon. c’est pas obligatoire, si vous faites sans il suffit de supprimer la ligne  “  .\veyon-cli config import .. “ dans le fichier 2-)

Sur la clé usb à la racine ou dans le dossier il doit avoir les fichiers suivants :
-	les fichiers 1- et 2-
-	l’installation 64bits ou 32bits selon vos pc
-	la clé publique ( XXX_public_key.pem)
-	la config du master (myconfig.json)

# CONFIGURATION
## Editer le fichier 1-
met le setup qui te plait (64 ou 32 bits).
## Editer le fichier 2-
modifier $locat et mettre le nom de la salle que vous avez rentré dans le master.
modifier les variables pour que les noms de vos fichiers correspondent. 
Le chemin d’installation par défaut c’est C:\Program Files\Veyon\, à changer selon tes besoins.

Après plus besoin de modifier ces fichiers.

# INSTALLATION

## Exécuter le fichier 1- en tant qu’admin
La première ligne baisse le niveau de sécurité pour exécuter des scripts. On rétablit ce paramètre dans le fichier 2-.

la ligne suivante :
-	installe la version de Veyon de votre choix,
-	en silencieux /S,
-	sans le logiciel master “/nomaster” pour les pc “““esclaves”””. ( ce serait con que les élèves prennent le contrôle des autres pc).
L'installation est silencieuse, donc pas de fenêtre, rien à accepter. C’est rapide. C’est terminé quand tu peux de nouveau écrire dans le terminal et que l'icône veyron apparaît en bas à droite avec les appli en arrière plan. 


## Ouvrir powershell en tant qu’admin.
### Naviguer jusqu'à la clé ou dossier
( cd D:/ par exemple).
## Exécuter le fichier -2. 
(tape le nom du fichier 2- et fait entrer)
Ce script ajoute le nom de la salle où doit apparaître le pc, installe la config et la clé publique et désautorise l'exécution de scripts.
La fenêtre se ferme 2 secondes après que tout ait été exécuté.

Et voilà c’est fini ! Ya plus qu’a répéter l’opération sur les autres pc.

Voici quelque lien utiles :

Une vidéo d’installation : [Installing Veyon for Schools](https://www.youtube.com/watch?v=HrHJqdsCXUw)

La documentation Veyon : [Veyon Documentation](https://docs.veyon.io/en/latest/)

Ton meilleur ami : [Google](https://www.google.com/)

Bonus : [BoNuS](https://www.youtube.com/watch?v=dQw4w9WgXcQ)


# FAQ :
**Ça fonctionne sur quels OS ?**
> J’ai installé des pc windows 7 et windows 10. il ne devrait pas y avoir de pb pour Windows 11. Pas la peine d’essayer sur autre chose hein, c’est du POWERSHELL bordel. Pardon.

**Comment j'allume un pc à distance ?**
> il faut mettre son adresse MAC dans le configurateur

**Pourquoi il y a un fichier bat et un fichier ps1 ? pourquoi pas les deux ps1 ?**
>	Je sais plus, mais ça fonctionne très bien comme ça.

**Je peux copier les fichiers sur le pc et lancer les scripts ?**
>	Oui, assure-toi bien d’exécuter les scripts depuis le dossier ou sont les fichiers. Tout doit être au même endroit.

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
