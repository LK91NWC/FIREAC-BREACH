-- FIREAC Configuration
-- Copyright 2022-2026 by Amirreza Jaberi (https://github.com/AmirrezaJaberi)
-- Licensed under the GNU Affero General Public License v3.0
--
-- [BREACH] 2026-10-05 (LK) : reglages adaptes a BREACH RP. Original : fire-config.lua.avant-breach.
-- Regle : on ne BANNIT automatiquement que pour ce qui est CERTAIN. Tout ce qui peut venir d'un de nos
-- scripts (invincibilite pendant un menu, teleportation d'un logement, lunettes de vision nocturne,
-- couleurs du tuning, explosions des zombies...) est seulement SIGNALE (WARN : console + webhook)
-- ou coupe. Les admins BREACH (rang ESX ou Breach_Admin) ne sont jamais sanctionnes.

FIREAC              = {}

FIREAC.Version      = "7.2.18"

FIREAC.ServerConfig = {
    Name  = "BREACH RP",

    Port  = "30120",

    Linux = false
}

-- [BREACH] reglages propres a BREACH
FIREAC.Breach = {
    -- Les admins BREACH (exports.Breach_Core:IsAdmin) sont admins FIREAC sans passer par sa table.
    UseBreachAdmins = true,
    -- Un ban ne bloque QUE les identifiants du compte (licence, Discord, Steam, Xbox).
    -- IP et jetons materiels : desactives (box familiale, PC partage, tests de LK sur sa machine).
    BanMatchIP = false,
    BanMatchTokens = false,
    -- Code source de CETTE version modifiee (licence AGPL-3.0, article 13) : a publier puis a renseigner.
    SourceUrl = "https://github.com/LK91NWC/FIREAC-BREACH",   -- [BREACH] 2026-10-06 : version modifiee publiee (AGPL-3.0)
}

FIREAC.ACE = {
    Enable = false,
    Admin = "FIREAC.Admin",
    Whitelist = "FIREAC.Whitelist",
    Unban = "FIREAC.Unban"
}

FIREAC.ChatSettings             = {
    Enable      = true,
    PrivateWarn = true      -- [BREACH] voir FIREAC_MESSAGE : sanctions annoncees aux admins seulement
}

FIREAC.ScreenShot               = {
    Enable  = false,        -- [BREACH] discord-screenshot n'est pas installe
    Format  = "PNG",
    Quality = 1
}

FIREAC.Connection               = {
    AntiBlackListName = true,
    AntiVPN           = false,   -- [BREACH] enverrait l'IP des joueurs a ip-api.com
    HideIP            = true,

    UseDeferrals      = true,
    DeferralMode      = "card",
    DeferralDelayMs   = 0,
    DeferralStepMs    = 60,
    AdaptiveCard      = true,

    ShowConnectUI     = false,   -- [BREACH] connexion rapide : la carte ne s'affiche que si l'acces est refuse
    ShowProblemCard   = true,
    ProblemOnlyMode   = true,

    PresentCardOnce   = false,
    PresentCardHoldMs = 600,
    CardTitle         = "BREACH • SECURITE",
    VisualStepMs      = 120,
    ConnectHoldMs     = 0
}

FIREAC.ServerRuntime            = {
    EntityCreatedMonitor = false,   -- [BREACH] nos scripts creent beaucoup d'entites (zombies, animaux, camps)
    EntityCreatedDelayMs = 750
}

FIREAC.Detection = {
    RequirePlayerSpawned = true,
    RequireFrameworkLoaded = true,
    ReadyMaxWaitMs = 120000,
    MinimumClientReadyMs = 12000,
    ResourceRestartAssumeSpawnedMs = 8000,

    SpawnGraceMs = 30000,
    PostSpawnSettleMs = 20000,
    PostReadyGraceMs = 30000,
    FrameworkLoadGraceMs = 15000,
    RespawnGraceMs = 20000,
    PedChangeGraceMs = 15000,
    CameraGraceMs = 3500,
    GodmodeAfterReadyMs = 15000,

    EvidenceThreshold = 3,
    EvidenceWindowMs = 15000,
    GodmodeSamples = 8,
    ClientReportCooldownMs = 10000,
    ServerReportWindowMs = 10000,
    ServerReportLimit = 6
}

FIREAC.Message                  = {
    Kick = "Tu as été expulsé par la protection du serveur. Si c'est une erreur, ouvre un ticket sur le Discord.",
    Ban  = "Tu as été banni du serveur. Si c'est une erreur, ouvre un ticket sur le Discord avec ton numéro de bannissement.",
}

FIREAC.AdminMenu                = {
    Enable         = true,
    Key            = "",        -- [BREACH] pas de touche : s'ouvre depuis le F9 (BREACH > Anticheat)
    MenuPunishment = "BAN"      -- un NON-admin qui appelle les evenements du panneau = triche certaine
}

-- Sante / armure au-dessus du maximum du jeu (aucun de nos scripts ne depasse 200 / 100)
FIREAC.AntiHealthHack           = true
FIREAC.MaxHealth                = 200
FIREAC.HealthPunishment         = "KICK"

FIREAC.AntiArmorHack            = true
FIREAC.MaxArmor                 = 100
FIREAC.ArmorPunishment          = "KICK"

FIREAC.AntiBlacklistTasks       = false
FIREAC.TasksPunishment          = "WARN"

FIREAC.AntiBlacklistAnims       = true
FIREAC.AnimsPunishment          = "WARN"

FIREAC.AntiInfinityAmmo         = true

-- Seul le F9 (admins) utilise le mode spectateur
FIREAC.AntiSpectate             = true
FIREAC.SpactatePunishment       = "KICK"
FIREAC.SpectatePunishment       = FIREAC.SpactatePunishment

-- Liste d'armes reduite a celles qui n'existent PAS sur BREACH (tables/fire-weapon.lua)
FIREAC.AntiBlackListWeapon      = true
FIREAC.AntiAddWeapon            = false
FIREAC.AntiRemoveWeapon         = false
FIREAC.WeaponPunishment         = "KICK"

-- Coiffeur, vetements, garage, concession, mecano, menottes, a terre, sommeil, cinematique, drogue...
-- rendent le joueur invincible ou invisible : signalement seulement.
FIREAC.AntiGodMode              = true
FIREAC.GodPunishment            = "WARN"

FIREAC.AntiInvisible            = true
FIREAC.InvisiblePunishment      = "WARN"

FIREAC.AntiChangeSpeed          = true      -- tuning, nitro : signalement
FIREAC.SpeedPunishment          = "WARN"

FIREAC.AntiFreeCam              = false
FIREAC.CamPunishment            = "WARN"

FIREAC.AntiRainbowVehicle       = true      -- apercu des couleurs chez le mecano : signalement
FIREAC.RainbowPunishment        = "WARN"

FIREAC.AntiPlateChanger         = true
FIREAC.AntiBlackListPlate       = false     -- plaques perso (« COOKIE »...) : pas de sanction
FIREAC.PlatePunishment          = "WARN"

-- Lunettes militaires (sinor-MilitaryGoggles), jumelles : vision nocturne / thermique legitimes
FIREAC.AntiNightVision          = false
FIREAC.AntiThermalVision        = false
FIREAC.VisionPunishment         = "WARN"

-- Confirme par le serveur (IsPlayerUsingSuperJump) ; seul le F9 l'active, pour les admins
FIREAC.AntiSuperJump            = true
FIREAC.JumpPunishment           = "KICK"

-- Logements, ascenseurs, prison, hopital, garages : teleportations legitimes -> signalement
FIREAC.AntiTeleport             = true
FIREAC.MaxFootDistance          = 250
FIREAC.MaxVehicleDistance       = 700
FIREAC.TeleportPunishment       = "WARN"

FIREAC.AntiNoclip               = false
FIREAC.NoclipPunishment         = "WARN"

FIREAC.AntiPedChanger           = true
FIREAC.PedChangePunishment      = "KICK"

FIREAC.AntiInfiniteStamina      = false     -- Breach_XP (endurance) : pas de controle
FIREAC.InfinitePunishment       = "WARN"


FIREAC.AntiTinyPed              = true
FIREAC.PedFlagPunishment        = "KICK"

FIREAC.AntiSuicide              = false
FIREAC.SuicidePunishment        = "WARN"

FIREAC.AntiPickupCollect        = false
FIREAC.PickupPunishment         = "WARN"

FIREAC.AntiSpamChat             = true
FIREAC.MaxMessage               = 10
FIREAC.CoolDownSec              = 3
FIREAC.ChatPunishment           = "KICK"

-- Commandes de menus de triche connus (liste reduite : plus de « /lol », « /haha », « /panic »...)
FIREAC.AntiBlackListCommands    = true
FIREAC.CMDPunishment            = "BAN"

FIREAC.AntiWeaponDamageChanger  = true
FIREAC.DamagePunishment         = "KICK"

FIREAC.AntiBlackListWord        = false     -- « cheat », « matrix », « falcon »... trop de faux positifs en RP
FIREAC.WordPunishment           = "WARN"

FIREAC.AntiBringAll             = false
FIREAC.BringAllPunishment       = "BAN"

FIREAC.AntiBlackListTrigger     = false
FIREAC.AntiSpamTrigger          = true
FIREAC.TriggerPunishment        = "KICK"

FIREAC.AntiClearPedTasks        = false
FIREAC.MaxClearPedTasks         = 5
FIREAC.CPTPunishment            = "WARN"

-- Un policier peut toucher 3 fois au taser en 10 s : seuil releve, signalement
FIREAC.AntiTazePlayers          = true
FIREAC.MaxTazeSpam              = 8
FIREAC.TazePunishment           = "WARN"

FIREAC.AntiInject               = false
FIREAC.InjectPunishment         = "BAN"

-- Hordes, zombies a bonbonne, PNJ de l'armee : explosions attribuees au joueur proche -> signalement
FIREAC.AntiExplosionSpam        = true
FIREAC.MaxExplosion             = 30
FIREAC.ExplosionSpamPunishment  = "WARN"

FIREAC.AntiBlackListObject      = true
FIREAC.AntiBlackListPed         = true
FIREAC.AntiBlackListBuilding    = true
FIREAC.AntiBlackListVehicle     = true
FIREAC.EntityPunishment         = "WARN"


FIREAC.AntiSpamVehicle          = true
FIREAC.MaxVehicle               = 10

FIREAC.AntiSpamPed              = true
FIREAC.MaxPed                   = 4

FIREAC.AntiSpamObject           = true
FIREAC.MaxObject                = 15

FIREAC.SpamPunishment           = "WARN"

FIREAC.AntiChangePerm           = false
FIREAC.PermPunishment           = "BAN"

FIREAC.AntiPlaySound            = true
FIREAC.SoundPunishment          = "KICK"
