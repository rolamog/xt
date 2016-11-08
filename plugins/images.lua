do

function run(msg, matches)
  local url = matches[1]
  local receiver = get_receiver(msg)
  send_photo_from_url(receiver, url)
end

return {
  description = "When user sends image URL (ends with png, jpg, jpeg) download and send it to origin.", 
  usage = "",
  patterns = {
    "(https?://[%w-_%.%?%.:/%+=&]+%.png)$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.jpg)$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.jpeg)$",
  }, 
  run = run 
}

end

local function run(msg, matches)
  local text = matches[1]
  local b = 1

  while b ~= 0 do
    text = text:trim()
    text,b = text:gsub('^!+','')
  end
  return text
end

return {
  description = "Simplest plugin ever!",
  usage = "!echo [whatever]: echoes the msg",
  patterns = {
    "^بگو +(.+)$"
  }, 
  run = run 
}
