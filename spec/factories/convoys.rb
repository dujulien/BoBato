FactoryBot.define do

  factory :convoy do

    boat_owner_id { User.last }
    title { "Traversée de la Manche" }
		description { "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus lobortis in orci a accumsan. Sed egestas sem pretium libero gravida, id ullamcorper nunc ultricies." }
		boat_type { "Yacht" } # ["Yacht", "Catamaran", "Voilier"] 
		required_license { "Tous permis" }
		departure_port { "Marseille" } # ["Marseille", "Mykonos", "Barcelone", "Athènes", "Tanger", "Genes"]
		arrival_port { "Toulon" } # ["Toulon", "Ajaccio", "Bonifacio", "Split", "Palerme", "Dubrovnik"] 
		date_of_departure { DateTime.new(2019,12,14) } 
		date_of_arrival { DateTime.new(2019,12,18) } 
		convoy_price { 2000 }
	
	end

end
