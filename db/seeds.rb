# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

10.times do 
	Skipper.create(
								first_name: Faker::Name.first_name, 
								last_name: Faker::Name.last_name, 
								birthdate: DateTime.new(rand(1970..2000), rand(1..12), rand(1..28)),
								city: Faker::Address.state, 
								description: Faker::ChuckNorris.fact, 
								experience: Faker::Movies::VForVendetta.quote, 
								licence: "Tous permis", 
								email: Faker::Internet.email, 
								password: 'AZERTY'
								)
end


5.times do 
	BoatOwner.create(
									first_name: Faker::Name.first_name , 
									last_name: Faker::Name.last_name, 
									birthdate: DateTime.new(rand(1970..2000), rand(1..12), rand(1..28)),
									city: Faker::Address.state, 
									description: Faker::ChuckNorris.fact, 
									email: Faker::Internet.email, 
									password: 'AZERTY'
									)
end


5.times do |i|
	Convoy.create(
								boat_owner: BoatOwner.find(i+1), 
								boat_type: ["Yacht", "Catamaran", "Sail Boat"].sample, 
								required_license: "Tous permis",
								departure_port: ["Marseille", "Mykonos", "Barcelone", "Athènes", "Tanger", "Genes"].sample,
								arrival_port: ["Toulon", "Ajaccio", "Bonifacio", "Split", "Palerme", "Dubrovnik"].sample, 
								date_of_departure: DateTime.new(2020, rand(1..4), rand(1..28)), 
								date_of_arrival: DateTime.new(2020, rand(5..9), rand(1..28)), 
								convoy_price: rand(2000..10000)
								)
end


10.times do |i|
	Submission.create(
										skipper: Skipper.find(i+1), 
										convoy: Convoy.find((i/2)+1)
										)
end


5.times do |i|
	Delivery.create(
									skipper: Skipper.find(rand((2*i)+1..2*(i+1))), 
									convoy: Convoy.find(i+1),
									stripe_id: (i+1)*rand(1..23134)
									)
end





