Local finction(msg, matches)
If matches[1] = 'spam' and matches[2] = 'fuck' then
Return [[ 
عشقم سارا دوست دارم همیشه در قلب منی 
]],
end if
End

Return {
Useage = "to spam somewhere",
Description = " a simple plugin to leafn lua",
Patterns = {
"^[!/](spam) (.*)$"
},
run = run
moderated = true
}
