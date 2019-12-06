# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

15.times do |i|
	User.create(
							email: Faker::Internet.email, 
							password: 'AZERTY'
							)
	puts "User #{i+1} seeded"
end


5.times do |i|
	Convoy.create(
								boat_owner: User.find(i+1), 
								boat_type: ["Yacht", "Catamaran", "Voilier"].sample, 
								required_license: "Tous permis",
								departure_port: ["Marseille", "Mykonos", "Barcelone", "Athènes", "Tanger", "Genes"].sample,
								arrival_port: ["Toulon", "Ajaccio", "Bonifacio", "Split", "Palerme", "Dubrovnik"].sample, 
								date_of_departure: DateTime.new(2020, rand(1..4), rand(1..28)), 
								date_of_arrival: DateTime.new(2020, rand(5..9), rand(1..28)), 
								convoy_price: rand(2000..10000)
								)
	puts "Convoy #{i+1} seeded"
end


10.times do |i|
	Submission.create(
										skipper: User.find(i+6), 
										convoy: Convoy.find((i/2)+1)
										)
	puts "Submission #{i+1} seeded"
end


5.times do |i|
	Delivery.create(
									skipper: User.find(rand((2*(i+3)..2*(i+3)+1))), 
									convoy: Convoy.find(i+1),
									stripe_id: (i+1)*rand(1..23134)
									)
	puts "Delivery #{i+1} seeded"
end





