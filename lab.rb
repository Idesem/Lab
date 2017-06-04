require_relative "D:/projekt/hero.rb"
require_relative "D:/projekt/objects.rb"

class Labirynt
	def wypisz
		@tab.length.times do |i|
			2.times do |k|
				puts @przedmio[i][k].typ
			end
			puts "\n\n"
		end
	end
	def tworz(ile)
		while ile<10
			puts "za maly labirynt podaj liczbe wieksza od 10"
			ile=gets
			ile=ile.chomp
			ile=ile.to_i
		end
		@rozmiar=ile
		@poprzednik=Array.new(ile)
		@tab=Array.new
		licz=1
		@tab[0]=Array.new
		pom=0
		rando=Random.new
		while licz < ile
			gotowe=false
			while gotowe!=true
				pom=rando.rand(licz)
				if @tab[pom].length<4
					gotowe=true
				end
			end
			@tab[licz]=Array.new
			@poprzednik[licz]=pom
			@tab[pom].push(licz)
			licz+=1
		end
		@przedmio=Array.new(@tab.length) { Array.new(2) }
		@tab.length.times do |i|
			2.times do |k|
				pom=rando.rand(100)
				case pom
				when 0..44
					@przedmio[i][k]=Skarb.new
				when 45..59
					@przedmio[i][k]=Jedzenie.new
				when 60..69
					@przedmio[i][k]=Oboz.new
				when 70..84
					@przedmio[i][k]=Zlodziej.new
				when 85..94
					@przedmio[i][k]=Noz.new
				when 95..97
					@przedmio[i][k]=Pistolet.new
				when 98..99
					pom2=rando.rand(4)+1
					@przedmio[i][k]=Pocisk.new
					@przedmio[i][k].ilosc+=pom2
				else
					puts "zapelniatoro_labirynto_bledo_podawaczo_inator"
				end
			end
		end
		wyk=Array.new
		wyk2=Array.new
		pom2=-2
		(@tab.length/10+1).times do
			dobre=false
			while(dobre==false)
				pom=rando.rand(@tab.length/2)+@tab.length-@tab.length/2
				if (wyk.index(pom)==nil)
					dobre=true
				end
			end
			@przedmio[pom][0]=Drzwi.new
			dobre=false
			while(dobre==false)
				pom2=rando.rand(pom+1)
				if (wyk2.index(pom2)==nil)
					dobre=true
				end
			end
			@przedmio[pom2][1]=Klucz.new
			wyk.push(pom)
			wyk2.push(pom2)
		end
	end
	attr_accessor :tab,:przedmio,:poprzednik
end
