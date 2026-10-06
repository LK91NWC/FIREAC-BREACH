# FIREAC : modifications BREACH (2026-10-05)

Source : https://github.com/AmirrezaJaberi/FIREAC (commit 4a11904, v7.2.18), licence **AGPL-3.0**.
Chaque fichier modifié a son original à côté (`*.avant-breach`). Le code de Breach n'est PAS copié ici
(seulement des appels : `exports.Breach_Core:IsAdmin`, état `breachId`) et rien de FIREAC n'est copié dans Breach.

## Licence AGPL-3.0 : ce qu'elle impose
Une version **modifiée** d'un programme AGPL utilisé par des joueurs à travers le réseau doit leur **offrir
son code source** (article 13). À faire par LK : publier ce dossier (sans `configs/fire-webhook.lua` rempli)
dans un dépôt public (fork GitHub), puis mettre son adresse dans `FIREAC.Breach.SourceUrl`
(`configs/fire-config.lua`). Elle s'affiche au démarrage du serveur ; le pied du panneau y renvoie.

## Réglages (`configs/fire-config.lua`)
- Bannissement automatique seulement pour le certain : commandes de menus de triche connus, appel des
  événements du panneau par un non-admin. Expulsion : santé > 200, armure > 100, mode spectateur, super saut
  (confirmé par le serveur), modèle interdit, « petit ped », arme absente du serveur, dégâts d'arme modifiés,
  spam du chat ou d'événements.
- Signalement seulement (console `[BREACH:ANTICHEAT]` + webhook) : invincibilité, invisibilité (nos menus,
  menottes, mort, sommeil, cinématique, drogue les utilisent), téléportation (logements, ascenseurs, prison),
  vitesse et couleurs de véhicule (tuning), plaques, explosions en série (zombies, armée), taser.
- Coupé : vision nocturne / thermique (lunettes militaires, jumelles), endurance infinie (Breach_XP),
  mots interdits dans le chat, plaques interdites, anti-VPN (enverrait l'IP à ip-api.com), surveillance des
  entités créées, captures d'écran.
- Connexion : la carte FIREAC n'apparaît que si l'accès est refusé (pas d'attente à chaque connexion).

## Listes (`tables/`)
- `fire-weapon.lua` : seulement les armes ABSENTES d'ox_inventory (4). La liste d'origine contenait la
  bouteille, le DIGISCANNER d'af-expeditions, grenades, RPG, MK2...
- `fire-explosions.lua` : plus de sanction par type d'explosion (journal gardé).
- `fire-cmd.lua` : retiré « lol », « haha », « panic », « jd »... (un joueur qui les tape était banni).
- `fire-name.lua` : retiré « admin », « owner », « moderator », youtube / twitch, « ? », « § »...

## Code
- `src/fire-server.lua` : admins BREACH = admins FIREAC ; licence jamais envoyée en clair au panneau
  (ID BREACH + début de licence) ; listes envoyées sans IP ni jetons ; un ban ne bloque plus par IP ni par
  jeton matériel (`FIREAC.Breach.BanMatchIP/BanMatchTokens`) ; sanctions annoncées aux admins par notification
  (jamais à tout le serveur, signalements en console) ; textes en français ; apparition de véhicule et
  suppression de toutes les entités coupées.
- `src/fire-menu.lua` : plus de touche ni de commande ; ouverture par l'événement local `breach:fireacOpen`
  (F9 > BREACH > Anticheat) ; « toutes les armes » coupé.
- `ui/` : en français, couleurs BREACH (vert #26f758, noir neutre, Pirata One / Nunito), logo BREACH
  (`assists/logo.png`, copie de Breach_Pause) ; onglets Soi / Entités / Téléportation / Véhicule retirés.

## Installation
- Tables : `database.sql` importé dans `breachv2` (fireac_admin, fireac_banlist, fireac_unban, fireac_whitelist).
- `server.cfg` : `ensure FIREAC` après `ensure [breach]` (original : `server.cfg.avant-anticheat`).
- Webhooks Discord : voir plus bas (fichier local `configs/fire-webhook.local.lua`). Ne jamais les publier.

## 2026-10-06 — Publication du code modifié (AGPL-3.0)
- Version modifiée publiée : https://github.com/LK91NWC/FIREAC-BREACH (`FIREAC.Breach.SourceUrl`, `configs/fire-config.lua`).

## 2026-10-06 — Webhooks Discord hors du dépôt public
- `configs/fire-webhook.lua` reste vide (public). Les vraies URLs vont dans `configs/fire-webhook.local.lua`
  (ignoré par git, à créer sur le serveur en copiant `configs/fire-webhook.local.example.lua`).
  Chargé au démarrage (« return { Ban = ... } » ou « FIREAC.Webhooks.Ban = ... ») ; fichier absent = pas d'envoi,
  fichier invalide = message en console.
- `src/fire-server.lua` : faute de frappe `Webhooks.Exoplosion` corrigée (le webhook Explosion ne partait jamais).
