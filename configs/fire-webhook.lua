-- FIREAC (https://github.com/AmirrezaJaberi/FIREAC)
-- Copyright 2022-2026 by Amirreza Jaberi (https://github.com/AmirrezaJaberi)
-- Licensed under the GNU Affero General Public License v3.0
--
-- [BREACH] 2026-10-06 : NE PAS remplir ce fichier (il est public sur GitHub).
-- Les vraies URLs vont dans configs/fire-webhook.local.lua (ignore par git, reste sur le serveur).
-- Modele : configs/fire-webhook.local.example.lua

FIREAC.Webhooks = {
    Ban        = "",

    Error      = "",

    Connect    = "",

    Disconnect = "",

    Explosion  = "",

    ScreenShot = "",
}

-- [BREACH] chargement des URLs locales (si le fichier existe)
do
    local path = "configs/fire-webhook.local.lua"
    local code = LoadResourceFile(GetCurrentResourceName(), path)
    if code then
        local chunk, err = load(code, "@" .. path, "t", {})
        local ok, overrides = false, nil
        if chunk then ok, overrides = pcall(chunk) else overrides = err end
        if ok and type(overrides) == "table" then
            for name, url in pairs(overrides) do
                if FIREAC.Webhooks[name] ~= nil and type(url) == "string" and url ~= "" then
                    FIREAC.Webhooks[name] = url
                end
            end
        else
            print("^1[FIREAC] " .. path .. " invalide : " .. tostring(overrides) .. "^0")
        end
    end
end
