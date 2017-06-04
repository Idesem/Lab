require_relative "D:/projekt/lab.rb"
require "fileutils"

class Gra
	def initialize
		puts "Witaj w grze Nazwe wymysle pozniej v-1.0"
		puts "Aby rozpoczac nowa gre wpisz "'"'"nowa"'"'
		puts "Aby wczytac rozgrywke wpisz "'"'"wczytaj"'"'" oraz nazwe zapisanej gry"
		pom=gets.chomp.split
		if pom[0]=="nowa"
			puts "Podaj imie botatera"
			pom2=gets.chomp
			@bohater=Bohater.new(pom2)
			puts "Podaj wielkosc labiryntu"
			pom2=gets.chomp.to_i
			@lab=Labirynt.new
			@lab.tworz(pom2)
		end
		if pom[0]=="wczytaj"
			pom2=pom[1]+".txt"
			pom3=""
			if File.exist?(pom2)
				File.open(pom2,"r") do |f|
					pom3=f.read
				end
				foc=0
				@bohater=Bohater.new("")
				@bohater.nazwa=""
				while pom3[foc+2]!='"'
					@bohater.nazwa+=pom3[foc+2]
					foc+=1
				end
				pom3=pom3[(foc+5)..-1]
				foc=0
				pom4=""
				while (pom3[foc]=~/\d/)!= nil
					pom4+=pom3[foc]
					foc+=1
				end
				@bohater.zloto=pom4.to_i
				pom4=""
				pom3=pom3[foc+2..-1]
				foc=0
				while (pom3[foc]=~/\d/)!= nil
					pom4+=pom3[foc]
					foc+=1
				end
				@bohater.walka=pom4.to_i
				pom3=pom3[foc+2..-1]
				pom4=""
				foc=0
				while (pom3[foc]=~/\d/)!= nil
					pom4+=pom3[foc]
					foc+=1
				end
				@bohater.doswiadczenie=pom4.to_i
				puts "Podaj wielkosc labiryntu"
				pom2=gets.chomp.to_i
				@lab=Labirynt.new
				@lab.tworz(pom2)
			else
				puts "Bledna nazwa pliku"
			end
		end
	end
	def wlacz
		puts "\n\n\n\n"
		puts "To jedyne wyjscie....\n\n"
		sleep(1.5)
		puts "Nic nie pozostalo....\n\n"
		sleep(1.5)
		puts "Przyjaciele powiedzieli ci o ostatniej nadziei na zdobycie pieniedzy...\n\n"
		sleep(2)
		puts "Schodzisz ciemnym korytarzem wglab tajemniczej budowli...\n\n"
		sleep(2)
		puts "Po paru minutach twoim oczom ukazuje sie swiatlo ....\n\n"
		sleep(1)
		puts "-Witaj w moim sklepiku. Chcesz cos kupisz zanim zginiesz ? - Slyszysz pytanie osoby siedzacej za lada."
		puts "-To ostatnia szansza, dalej jest tylko labirynt ...\n\n\n\n\n\n\n\n"
		puts "Aby zakupic przedmiot wpisz jego nazwe, aby wyjsc ze sklepu wpisz '"'nie'"',\n aby zobaczyc zawartosc plecaka wpisz '"'plecak'"'"
		puts "Twoje zloto   "+@bohater.zloto.to_s+"\n\n\n"
		puts "Jedzenie - 150","Oboz - 350","Noz - 2300","Pistolet - 4200","Naboj - 800","Klucz - 3100\n\n"
		pom=nil
		while pom!="nie"
			pom=gets.chomp
			case pom
			when "Jedzenie"
				if @bohater.zloto>149
					if @bohater.umiesc(Jedzenie.new)==-1
						puts "nie masz miejsca w plecaku"
					else
						puts "Zakupiono Jedzenie"
						@bohater.zloto-=150
					end
				else
					puts "Nie stac cie"
				end
			when "Oboz"
				if @bohater.zloto>349
					if @bohater.umiesc(Oboz.new)==-1
						puts "nie masz miejsca w plecaku"
					else
						puts "Zakupiono Oboz"
						@bohater.zloto-=350
					end
				else
					puts "Nie stac cie"
				end
			when "Noz"
				if @bohater.zloto>2299
					if @bohater.umiesc(Noz.new)==-1
						puts "nie masz miejsca w plecaku"
					else
						puts "Zakupiono Noz"
						@bohater.zloto-=2300
					end
				else
					puts "Nie stac cie"
				end
			when "Pistolet"
				if @bohater.zloto>4199
					if @bohater.umiesc(Pistolet.new)==-1
						puts "nie masz miejsca w plecaku"
					else
						puts "Zakupiono Pistolet"
						@bohater.zloto-=4200
					end
				else
					puts "Nie stac cie"
				end
			when "Naboj"
				if @bohater.zloto>799
					jest=false
					20.times do |i|
						if (@bohater.plecak[i]!=nil)
							if(@bohater.plecak[i].typ=="ha")
								jest=true
								@bohater.plecak[i].ilosc+=1
								puts "Zakupiono pocisk"
							end
						end
					end
					if(jest==false)
						pom2=Pocisk.new
						pom2.ilosc+=1
						if @bohater.umiesc(pom2)==-1
							puts "nie masz miejsca w plecaku"
						else
							puts "Zakupiono Pocisk"
							@bohater.zloto-=800
						end
					end
				else
					puts "Nie stac cie"
				end
			when "Klucz"
				if @bohater.zloto>3099
					if @bohater.umiesc(Klucz.new)==-1
						puts "nie masz miejsca w plecaku"
					else
						puts "Zakupiono Klucz"
						@bohater.zloto-=3100
					end
				else
					puts "Nie stac cie"
				end
			when "plecak"
				20.times do |i|
					if(@bohater.plecak[i]!=nil)
						if @bohater.plecak[i].typ=="ha"
							puts @bohater.plecak[i].opis+" "+@bohater.plecak[i].ilosc.to_s
						else
							puts @bohater.plecak[i].opis
						end
					end
				end
			when "nie"
			else
				puts "Zla komenda"
			end
		end
		sleep(1.5)
		puts "Schodzisz wiec w pluszowa ciemnosc, ku nieznanemu ...\n\n"
		puts "Aby zalozyc bron wpisz '"'zaloz'"' oraz nazwe broni"
		puts "Aby zdjac bron wpisz '"'schowaj'"'"
		puts "Aby zobaczyc zawartosc plecaka wpisz '"'plecak'"'"
		puts "Aby zobaczyc zawartosc komnaty wpisz '"'rozejrzyj'"'"
		puts "Aby podniesc przedmiot wpisz '"'podnies'"' oraz nazwe przedmiotu"
		puts "Aby otworzyc drzwi wpisz '"'otworz'"'"
		puts "Aby rozpoczac interakcje ze zlodziejem wpisz '"'podejdz'"'"
		puts "Aby zaatakowac zlodzieja wpisz '"'atak'"'"
		puts "Aby zobaczyc ilosc drog naprzod wpisz '"'droga'"'"
		puts "Aby przejsc wglab labiryntu wpisz '"'wejdz'"' oraz numer przejscia(numerowane od 1)"
		puts "Aby zobaczyc stan bohatera wpisz '"'stan'"'"
		puts "Aby sprawdzic numer komnaty wpisz '"'info'"'"
		puts "Aby sprawdzic, czy jestes na koncu wpisz '"'koniec'"'"
		puts "Aby wrocic do komnaty blizej wejscia wpisz '"'wroc'"'\n\n"
		pom="a"
		kont=true
		gdzie=0
		while(kont==true)
			pom=gets.chomp.split
			puts "\n"
			case pom[0]
			when "rozejrzyj"
				if @lab.przedmio[gdzie][0]!=nil
					puts @lab.przedmio[gdzie][0].opis
				end
				if @lab.przedmio[gdzie][1]!=nil
					puts @lab.przedmio[gdzie][1].opis
				end
			when "podnies"
				if @lab.przedmio[gdzie][0]!=nil
					if pom[1]==@lab.przedmio[gdzie][0].opis
						if @lab.przedmio[gdzie][0].typ[0]=="h"&&@lab.przedmio[gdzie][0].typ!="hd"
							if @bohater.umiesc(@lab.przedmio[gdzie][0])==1
								puts "Podniesiono "+@lab.przedmio[gdzie][0].opis+"\n"
								@lab.przedmio[gdzie][0]=nil
							else
								puts "Plecak pelen\n"
							end
						else
							if @lab.przedmio[gdzie][0].typ=="hd"
								if @lab.przedmio[gdzie][0].otwarte==true
									if @bohater.umiesc(@lab.przedmio[gdzie][0])==1
										puts "Podniesiono "+@lab.przedmio[gdzie][0].opis+"\n"
										@lab.przedmio[gdzie][0]=nil
									else
										puts "Plecak pelen\n"
									end
								end
							else
								puts "Nie mozna podniesc\n"
							end
						end
					else
						if @lab.przedmio[gdzie][1]!=nil
							if pom[1]==@lab.przedmio[gdzie][1].opis
								if @lab.przedmio[gdzie][1].typ[0]=="h"
									if @bohater.umiesc(@lab.przedmio[gdzie][1])==1
										puts "Podniesiono "+@lab.przedmio[gdzie][1].opis+"\n"
										@lab.przedmio[gdzie][1]=nil
									else
										puts "Plecak pelen\n"
									end
								else
									if @lab.przedmio[gdzie][0].typ=="hd"
										if @lab.przedmio[gdzie][0].otwarte==true
											if @bohater.umiesc(@lab.przedmio[gdzie][0])==1
												puts "Podniesiono "+@lab.przedmio[gdzie][0].opis+"\n"
												@lab.przedmio[gdzie][0]=nil
											else
												puts "Plecak pelen\n"
											end
										else
											puts "Nie mozna podniesc\n"
										end
									else
										puts "Nie mozna podniesc\n"
									end
								end
							end
						end
					end
				else
					if @lab.przedmio[gdzie][1]!=nil
						if pom[1]==@lab.przedmio[gdzie][1].opis
							if @lab.przedmio[gdzie][1].typ[0]=="h"
								if @bohater.umiesc(@lab.przedmio[gdzie][1])==1
									puts "Podniesiono "+@lab.przedmio[gdzie][1].opis+"\n"
									@lab.przedmio[gdzie][1]=nil
								else
									puts "Plecak pelen\n"
								end
							else
								if @lab.przedmio[gdzie][0].typ=="hd"
									if @lab.przedmio[gdzie][0].otwarte==true
										if @bohater.umiesc(@lab.przedmio[gdzie][0])==1
											puts "Podniesiono "+@lab.przedmio[gdzie][0].opis+"\n"
											@lab.przedmio[gdzie][0]=nil
										else
											puts "Plecak pelen\n"
										end
									else
										puts "Nie mozna podniesc\n"
									end
								else										
									puts "Nie mozna podniesc\n"
								end
							end
						end
					end
				end
			when "zaloz"
				if @bohater.bron!=nil
					puts "Masz juz zalozona bron\n"
				else
					jest=false
					pom2=-1
					20.times do |i|
						if @bohater.plecak[i]!=nil
							if @bohater.plecak[i].opis==pom[1]
								pom2=i
								jest=true
							end
						end
					end
					if jest==true
						@bohater.bron=pom[1]
						@bohater.usun(pom2)
						puts "Zalozono "+pom[1]+"\n"
					else
						puts "Nie masz takiej broni"
					end
				end
			when "plecak"
				20.times do |i|
					if @bohater.plecak[i]!=nil
						if @bohater.plecak[i].typ=="ha"
							puts @bohater.plecak[i].opis+" "+@bohater.plecak[i].ilosc.to_s
						else
							puts @bohater.plecak[i].opis
						end
					end
				end
			when "zdejmij"
				case @bohater.bron
				when "Noz"
					if @bohater.umiesc(Noz.new)==1
						puts "Zdjeto Noz\n"
					else
						puts "Nie masz miejsca w plecaku\n"
					end
				when "Pistolet"
					if @bohater.umiesc(Pistolet.new)==1
						puts "Zdjeto Pistolet\n"
					else
						puts "Nie masz miejsca w plecaku\n"
					end
				else
					puts "Nie masz zalozonej broni\n"
				end
			when "otworz"
				if @lab.przedmio[gdzie][0].typ=="hd"
					jest=false
					pom2=-1
					20.times do |i|
						if @bohater.plecak[i]!=nil
							if @bohater.plecak[i].typ=="hk"
								jest=true
								pom2=i
							end
						end
					end
					if jest==true
						@lab.przedmio[gdzie][0].otwarte=true
						@bohater.usun(pom2)
						puts "Otwarto drzwi\n"
					else
						puts "Nie masz klucza\n"
					end
				else
					puts "Nie ma tu drzwi\n"
				end
			when "droga"
				puts @lab.tab[gdzie].length.to_s+"\n"
			when "wejdz"
				klopot=false
				if @lab.przedmio[gdzie][0]!=nil
					if @lab.przedmio[gdzie][0].typ=="hd"
						if @lab.przedmio[gdzie][0].otwarte==false
							klopot=true
						end
					end
				end
				if klopot==true
					puts "Drzwi sa zamkniete\n"
				else
					pom2=pom[1].to_i
					if (pom2>@lab.tab[gdzie].length)||(pom2<1)
						puts "Nie ma takiej drogi\n"
					else
						klopot=false
						if @lab.przedmio[gdzie][0]!=nil
							if @lab.przedmio[gdzie][0].typ=="ft"
								klopot=true
							end
						end
						if @lab.przedmio[gdzie][1]!=nil
							if @lab.przedmio[gdzie][1].typ=="ft"
								klopot=true
							end
						end
						if klopot==true
							puts "Nie mozesz przejsc gdy zlodziej jest w pokoju\n"
						else
							gdzie=@lab.tab[gdzie][pom2-1]
							puts "Wybrano "+pom2.to_s+" droge\n"
						end
					end
				end
			when "info"
				puts gdzie.to_s+"\n"
			when "wroc"
				if @lab.poprzednik[gdzie]!=nil
					gdzie=@lab.poprzednik[gdzie]
					puts "Powrocono\n"
				else
					puts "Droga ktora wszedles do labiryntu jest zamknieta\n"
				end
			when "koniec"
				if gdzie==@lab.tab.length-1
					if 	@lab.przedmio[gdzie][0]!=nil
						if @lab.przedmio[gdzie][0].typ=="hd"
							if @lab.przedmio[gdzie][0].otwarte==false
								puts "Nie mozna zakonczyc gdyz drzwi sa zamkniete\n"
							else
								kont=false
							end
						else
							kont=false
						end
					else
						kont=false
					end
				else
					puts "Nie widzisz jeszcze wyjscia\n"
				end
			when "podejdz"
				if @lab.przedmio[gdzie][0]!=nil
					if @lab.przedmio[gdzie][0].typ=="ft"
						jest=false
						pom2=-1
						20.times do |i|
							if @bohater.plecak[i]!=nil
								jest=true
								pom2=i
							end
						end
						if jest==true
							puts "Zlodziej ukradl ci "+@bohater.plecak[pom2].opis+"\n"
							@lab.przedmio[gdzie][0]=nil
							@bohater.usun(pom2)
						else
							if @bohater.zycie>2
								@bohater.zycie-=2
								puts "Zlodziej nie mial ci czego ukrasc ale zadal 2 punkty obrazen\n"
								@lab.przedmio[gdzie][0]=nil
							else
								puts "Zginoles"
								kont=false
							end
						end
					else
						if @lab.przedmio[gdzie][1]!=nil
							if @lab.przedmio[gdzie][1].typ=="ft"
								jest=false
								pom2=-1
								20.times do |i|
									if @bohater.plecak[i]!=nil
									jest=true
									pom2=i
									end
					    		end
								puts "Zlodziej ukradl ci "+@bohater.plecak[pom2].opis+"\n"
								@lab.przedmio[gdzie][1]=nil
								@bohater.usun(pom2)
							end
						end
					end
				else
					if @lab.przedmio[gdzie][1]!=nil
						if @lab.przedmio[gdzie][1].typ=="ft"
							jest=false
							pom2=-1
							20.times do |i|
								if @bohater.plecak[i]!=nil
								jest=true
								pom2=i
								end
						    end
						puts "Zlodziej ukradl ci "+@bohater.plecak[pom2].opis+"\n"
						@lab.przedmio[gdzie][1]=nil
						@bohater.usun(pom2)
						end
					else
						puts "Nie ma do kogo podejsc\n"
					end
				end
			when "stan"
				puts "zdrowie "+@bohater.zycie.to_s+"\n"
			when "atak"
				klopot=false
				ktory=-1
				if @lab.przedmio[gdzie][0]!=nil
					if @lab.przedmio[gdzie][0].typ=="ft"
						klopot=true
						ktory=0
					else
						if @lab.przedmio[gdzie][1]!=nil
							if @lab.przedmio[gdzie][1].typ=="ft"
								klopot=true
								ktory=1
							end
						end
					end
				else
					if @lab.przedmio[gdzie][1]!=nil
						if @lab.przedmio[gdzie][1].typ=="ft"
							klopot=true
							ktory=1
						end
					end
				end
				if klopot==true
					r=Random.new
					wygrana=false
					wynik=r.rand(85)
					wynik+=@bohater.walka
					wynik+=@lab.przedmio[gdzie][ktory].mod
					if @bohater.bron=="Noz"
						wynik+=10
					end
					if @bohater.bron=="Pistolet"
						poci=false
						miejsce=-1
						20.times do |i|
							if @bohater.plecak[i]!=nil
								if @bohater.plecak[i].typ=="ha"
									if @bohater.plecak[i].ilosc!=0
										poci=true
										miejsce=i
									end
								end
							end
						end
						if poci==true
							wygrana=true
							puts "Zastrzelono zlodzieja\n"
							strata=r.rand(4)+1
							@bohater.plecak[miejsce].ilosc-=strata
							if @bohater.plecak[miejsce].ilosc<1
								@bohater.usun[miejsce]
							end
						end
					end
					@lab.przedmio[gdzie][ktory]=nil
					if wygrana==false
						if wynik>50
							puts "Zabito zlodzieja"
							@bohater.walka+=2
						else
							puts "Zlodziej cie ogluszyl i okradl"
							20.times do |i|
								@bohater.usun(i)
							end
							@bohater.bron=nil
							@bohater.zloto/=2
							if @bohater.zycie>2
								@bohater.zycie-=2
							else
								puts "Zginoles"
								kont=false
							end
						end
					end
				else
					puts "Nie ma kogo atakowac\n"
				end
			else
				puts "Bledna komenda\n"
			end
		end
		puts "Gratulacje udalo ci sie opuscic labirynt(przynajmniej twoj duch ...)"
		@bohater.doswiadczenie+=1
		20.times do |i|
			if @bohater.plecak[i]!=nil
				@bohater.zloto+=@bohater.plecak[i].wartosc
			end
		end
		if @bohater.bron!=nil
			if @bohater.bron=="Noz"
				@bohater.zloto+=2000
			else
				@bohater.zloto+=3000
			end
		end
		puts "Aktualny wynik to "+@bohater.zloto.to_s+" sztuk zlota"
		puts "Czy chcesz zapisac bohatera ? (t/n)"
		pom=gets.chomp
		if pom=="t"
			puts "podaj nazwe zapisu (podanie istniejacej nadpisze zapis)\n"
			pom=gets.chomp
			File.open(pom+".txt","w+") do |f|
				f.write @bohater.wypisz
			end
		end
	end
end

g=Gra.new
g.wlacz
