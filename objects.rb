class Obiekt
	def initialize
		@typ="x"
		@opis="nic"
	end
	attr_accessor :typ,:opis
end
class Wrog < Obiekt
	def initialize
		@typ="f"
		@mod=0
		@opis="Wrog"
	end
	attr_accessor :mod
end
class Zlodziej < Wrog
	def initialize
		@typ="ft"
		@opis="Zlodziej"
		r=Random.new
		@mod=r.rand(21)-10
	end
end
class Handlowe < Obiekt
	def initialize
		@typ="h"
		@wartosc=0
		@opis="Handl"
	end
	attr_accessor :wartosc
end
class Drzwi < Handlowe
	def initialize
		@typ="hd"
		@opis="Drzwi"
		@otwarte=false
		@wartosc=4000
	end
	attr_accessor :otwarte
end
class Klucz < Handlowe
	def initialize
		@typ="hk"
		@wartosc=2000
		@opis="Klucz"
	end
end

class Spozywcze < Handlowe
	def initialize
		@typ="hs"
		@wartosc=0
		@opis="Spoz"
	end
end

class Jedzenie < Spozywcze
	def initialize
		@typ="hsj"
		@opis="Jedzenie"
		@wartosc=100
	end
end

class Oboz < Spozywcze
	def initialize
		@typ="hso"
		@opis="Oboz"
		@wartosc=250
	end
end

class Bron < Handlowe
	def initialize
		@typ="hb"
		@opis="Bron"
		@wartosc=0
	end
end

class Noz < Bron
	def initialize
		@typ="hbb"
		@opis="Noz"
		r=Random.new
		@mod=8+r.rand(5)
		@wartosc=1500
	end
end

class Pistolet < Bron
	def initialize
		@typ="hbs"
		@opis="Pistolet"
		@wartosc=3000
	end
end

class Pocisk < Handlowe
	def initialize
		@typ="ha"
		@opis="Pocisk"
		@ilosc=0
		@wartosc=0
	end
	attr_accessor :ilosc
end
class Skarb < Handlowe
	def initialize
		@typ="ht"
		@opis="Skarb"
		r=Random.new
		@wartosc=50*r.rand(20)+250
	end
end