class Bohater
	attr_accessor :nazwa,:poziom,:plecak,:zloto,:walka,:zycie,:glod,:oboz,:bron,:doswiadczenie
	def initialize(naz)
		@nazwa=naz
		@plecak=Array.new(20)
		@zloto=1000
		@walka=0
		@zycie=10
		@bron=nil
		@doswiadczenie=0
	end
	def wypisz
		dane=Array.new
		dane.push(@nazwa)
		dane.push(@zloto)
		dane.push(@walka)
		dane.push(@doswiadczenie)
		return dane
	end
	def wygrana
		@walka=@walka+1
	end
	def obrazenia(ile)
		@zycie=@zycie-ile
	end
	def umiesc(co)
		miejsce=false
		licz=19
		index=nil
		20.times do 
			if @plecak[licz]==nil
				miejsce=true
				index=licz
			end
			licz=licz-1
		end
		if index!=nil
			@plecak[index]=co
			return 1
		else
			return -1
		end
	end
	def usun(skad)
		@plecak[skad]=nil
	end
end