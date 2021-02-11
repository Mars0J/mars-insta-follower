




require 'watir'
require 'selenium-webdriver'
require 'csv'
require 'headless'

system("figlet Mars Insta Follower")

tarayıcı = Watir::Browser.new :firefox

insta_url = "https://instagram.com"
eposta = "seçtiğiniz bir eposta girin"
isim = "bir isim girin"
kullanıcı = "istediğiniz bir kullanıcı adı girin"
şifre = "bir şifre belirleyin"


url_takip = "https://instagram.com/user_to_follow/"

tarayıcı.goto(insta_url)

CSV.open("insta_file.csv", "a+") do |f|
                f << ["Email ID","Username","Fullname","Password"]
        end

başla_iterator = 'aaa'
bitti_iterator = "zzz"
for i in başla_iterator..bitti_iterator do
        local_email=eposta+"+"+i.to_s+"@gmail.com"
        local_username=kullanıcı+"_"+i.to_s
        local_fullname=isim+"_"+i.to_s
        local_password=şifre+"_"+i.to_s

        tarayıcı.text_field(:name => "emailOrPhone").set("#{local_email}")
	sleep(4)
	tarayıcı.text_field(:name => "fullName").set("#{local_fullname}")
	sleep(4)
	tarayıcı.text_field(:name => "username").set("#{local_username}")
	sleep(4)
	tarayıcı.text_field(:name => "password").set("#{local_password}")
	sleep(4)

	tarayıcı.span(:text => "Sign up").click

        sleep(5)

	CSV.open("insta_file.csv", "a+") do |f|
	f << [local_email,local_username,local_fullname,local_password]
	end

	puts local_email,local_username,local_fullname,local_password
	
	tarayıcı.goto(url_follow)
	sleep(4)
	if(tarayıcı.button(:class => "_qv64e _gexxb _r9b8f _njrw0").exists?)
		tarayıcı.button(:class => "_qv64e _gexxb _r9b8f _njrw0").click
		sleep(15)
	end

	sleep(10)
	
	tarayıcı.close()

	tarayıcı = Watir::Browser.new :chrome, switches: ['--incognito']
	tarayıcı.goto(insta_url)

	sleep(5)
end
