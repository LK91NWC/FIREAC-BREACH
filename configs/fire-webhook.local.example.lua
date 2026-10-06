-- [BREACH] Modele : copier ce fichier en configs/fire-webhook.local.lua (sur le serveur seulement)
-- et y mettre les URLs des webhooks Discord. Ce fichier-la est ignore par git : ne jamais le publier.
-- Une entree vide ou absente = pas d'envoi.

return {
    Ban        = "",   -- bans et expulsions
    Error      = "",   -- erreurs FIREAC
    Connect    = "",   -- connexions (et refus d'acces)
    Disconnect = "",   -- deconnexions
    Explosion  = "",   -- journal des explosions
    ScreenShot = "",   -- captures (desactivees sur BREACH)
}
