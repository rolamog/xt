do 
local function run(msg, matches) 

hash2 = 'bot:myinfo2:2'..msg.from.id 
hash3 = 'bot:myinfo3:3'..msg.from.id 
hash4 = 'bot:myinfo4:4'..msg.from.id 
hash5 = 'bot:myinfo5:5'..msg.from.id 
hash6 = 'bot:myinfo6:6'..msg.from.id 
hash7 = 'bot:myinfo7:7'..msg.from.id 
hash8 = 'bot:myinfo8:8'..msg.from.id 
hash9 = 'bot:myinfo9:9'..msg.from.id 
hash10 = 'bot:myinfo10:10'..msg.from.id 
hash = 'bot:myinfo'..msg.from.id 

if matches[1]:lower() == 'setmyage' then 

redis:set(hash2,'waiting:'..msg.from.id) 
return '💠 سن خود ارسال نمایید' 
else 
if redis:get(hash2) == 'waiting:'..msg.from.id then 
redis:set(hash2,msg.text) 
return 'سن شما با موفقیت ذخیره شد ✅' 
end 
end 

if matches[1]:lower() == 'setmyname' then 

redis:set(hash3,'waiting:'..msg.from.id) 
return '💠 نام خود را ارسال نمایید' 
else 
if redis:get(hash3) == 'waiting:'..msg.from.id then 
redis:set(hash3,msg.text) 
return 'نام شما با موفقیت ذخیره شد ✅' 
end 
end 

if matches[1]:lower() == 'setmyaddress' then 
redis:set(hash9,'waiting:'..msg.from.id) 
return '💠 محل سکونت خود را ارسال نمایید' 
else 
if redis:get(hash9) == 'waiting:'..msg.from.id then 
redis:set(hash9,msg.text) 
return 'محل سکونت با موفقیت ذخیره شد ✅' 
end 
end 

if matches[1]:lower() == 'setmysex' then 
redis:set(hash4,'waiting:'..msg.from.id) 
return '💠 جنسیت خود را ارسال نمایید' 
else 
if redis:get(hash4) == 'waiting:'..msg.from.id then 
redis:set(hash4,msg.text) 
return 'با موفقیت جنسیت شما ذخیره شد ✅' 
end 
end 

if matches[1]:lower() == 'setmyedu' then 
redis:set(hash5,'waiting:'..msg.from.id) 
return '💠 میزان تحصیلات خود را ارسال نمایید' 
else 
if redis:get(hash5) == 'waiting:'..msg.from.id then 
redis:set(hash5,msg.text) 
return 'با موفقیت میزان تحصیلات شما ذخیره شد ✅' 
end 
end 

if matches[1]:lower() == 'setmynum' then 
redis:set(hash6,'waiting:'..msg.from.id) 
return '💠 شماره تلفن خود را ارسال نمایید' 
else 
if redis:get(hash6) == 'waiting:'..msg.from.id then 
redis:set(hash6,msg.text) 
return 'شماره تلفن شما با موفقیت ذخیره شد ✅' 
end 
end 

if matches[1]:lower() == 'setmychannel' then 
redis:set(hash7,'waiting:'..msg.from.id) 
return '💠 آدرس کانال خود را ارسال نمایید' 
else 
if redis:get(hash7) == 'waiting:'..msg.from.id then 
redis:set(hash7,msg.text) 
return 'آدرس کانال شما با موفقیت ذخیره شد ✅' 
end 
end 

if matches[1]:lower() == 'setmyinsta' then 
redis:set(hash8,'waiting:'..msg.from.id) 
return '💠 آدرس اینستاگرام خود را ارسال نمایید' 
else 
if redis:get(hash8) == 'waiting:'..msg.from.id then 
redis:set(hash8,msg.text) 
return 'آدرس اینستاگرام شما با موفقیت ذخیره شد ✅' 
end 
end 

if matches[1]:lower() == 'setmysite' then 
redis:set(hash10,'waiting:'..msg.from.id) 
return '💠 آدرس سایت خود را ارسال نمایید' 
else 
if redis:get(hash10) == 'waiting:'..msg.from.id then 
redis:set(hash10,msg.text) 
return 'آدرس سایت شما با موفقیت ذخیره شد ✅' 
end 
end 

if matches[1]:lower() == 'myinfo' then 
return "Hi "..msg.from.first_name.."\n" 
.."\n".."<b>Your Name∶"..(redis:get(hash3) or 'NO NAME').."\n" 
.."Your Age∶"..(redis:get(hash2)  or 'NO AGE').."\n" 
.."Your Sex∶"..(redis:get(hash4)  or 'NO SEX').."\n" 
.."Your Address∶"..(redis:get(hash9)  or 'NO Address').."\n" 
.."Your Education∶"..(redis:get(hash5)  or 'NO Education').."\n" 
.."Your Number∶"..(redis:get(hash6)  or 'NO Number').."\n" 
.."Your Channel∶"..(redis:get(hash7)  or 'NO Channel').."\n" 
.."Your insta∶"..(redis:get(hash8)  or 'NO insta').."\n" 
.."Your Site∶"..(redis:get(hash10)  or 'NO Site').."\n\n" 
.."CHANNEL @Androidxt".."\n" 

end 
if matches[1]:lower()== 'delinfo' then 
    redis:del(hash, hash2, hash3, hash4, hash5, hash6, hash7, hash8, hash9, hash10) 
    return 'اطلاعات شما با موفقیت حذف شده ❎' 
    end 
end 

return { 
    patterns = { 
        '^[/!](setmyname)$', 
        '^[/!](setmyage)$', 
        '^[/!](setmyaddress)$', 
        '^[/!](myinfo)$', 
        '^[/!](setmysex)$', 
        '^[/!](setmyedu)$', 
        '^[/!](setmynum)$', 
        '^[/!](setmychannel)$', 
        '^[/!](setmyinsta)$', 
        '^[/!](setmysite)$', 
        '^[/!](delinfo)$', 
        '(.*)', 
    }, 
    run = run, 
    pre_process = pre_process 
} 
end 
