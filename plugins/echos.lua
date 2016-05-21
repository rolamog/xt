--------------------------------------------------
--      ____  ____ _____                        --
--     |    \|  _ )_   _|___ ____   __  __      --
--     | |_  )  _ \ | |/ ·__|  _ \_|  \/  |     --
--     |____/|____/ |_|\____/\_____|_/\/\_|     --
--                                              --
--------------------------------------------------
--                                              --
--       Developers: @Josepdal & @MaSkAoS       --
--     Support: @Skneos,  @iicc1 & @serx666     --
--                                              --
--------------------------------------------------

do
    local function run(msg, matches)
        text = 'سارا عشق مدیره😍خیلی دوسش داره جونشو برا لیلی میده😔 لطفا بهش احترام بزارین👈 '..lang_text(msg.to.id, 'commandsT')..':\n'
        local space = '\n'
        if matches[1] == '❤' and not matches[2] then
            if permissions(msg.from.id, msg.to.id, "mod_commands") then
                local langHash = 'langset:'..msg.to.id
                local lang = redis:get(langHash)
                for v,plugin in pairs(_config.enabled_plugins) do
                    local textHash = 'lang:'..lang..':'..plugin..':0'
                    if redis:get(textHash) then
                        for i=1, tonumber(lang_text(msg.to.id, plugin..':0')), 1 do
                            text = text..lang_text(msg.to.id, plugin..':'..i)..'\n'
                        end
                        text = text..space
                    end
                end
            else
                text = text..lang_text(msg.to.id, 'moderation:5')..'\n'
                text = text..lang_text(msg.to.id, 'version:1')..'\n'
                text = text..lang_text(msg.to.id, 'rules:1')..'\n'
            end
        elseif matches[1] == '❤' and matches[2] then
            if permissions(msg.from.id, msg.to.id, "mod_commands") then
                local langHash = 'langset:'..msg.to.id
                local lang = redis:get(langHash)
                for v,plugin in pairs(_config.enabled_plugins) do
                    if plugin == matches[2] then
                        local textHash = 'lang:'..lang..':'..plugin..':0'
                        if redis:get(textHash) then
                            for i=1, tonumber(lang_text(msg.to.id, plugin..':0')), 1 do
                                text = text..lang_text(msg.to.id, plugin..':'..i)..'\n'
                            end
                        end
                        return text
                    end
                end
                return 'ℹ️ '..lang_text(msg.to.id, 'errorNoPlug')
            else
                return '🚫 '..lang_text(msg.to.id, 'require_mod')
            end
        end
        return text
    end

    return {
        patterns = {
            "^(سارا)$",
            "^(..) (.+)"
        }, 
        run = run 
    }
end

for v,user in pairs(_gbans.gbans_users) do
    if tonumber(user) == tonumber(user_id) then
        return true
    end
  end
