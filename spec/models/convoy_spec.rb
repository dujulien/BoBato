require 'rails_helper'

RSpec.describe Convoy, type: :model do

  before(:each) do 
    @user = User.create(email: "test@test.com", password: "AZERTY")
    @convoy = FactoryBot.create(:convoy)
  end

  it "has a valid factory" do
    expect(build(:convoy)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@convoy).to be_a(Convoy)
    end

    describe "#boat_type" do
      it { expect(@convoy).to validate_presence_of(:boat_type) }
    end

  end

end

=begin
boat_owner: User.find(i+1), 
title: Faker::Movies::HitchhikersGuideToTheGalaxy.starship, 
description: Faker::Lorem.paragraph,
boat_type: ["Yacht", "Catamaran", "Voilier"].sample, 
required_license: "Tous permis",
departure_port: ["Marseille", "Mykonos", "Barcelone", "Athènes", "Tanger", "Genes"].sample,
arrival_port: ["Toulon", "Ajaccio", "Bonifacio", "Split", "Palerme", "Dubrovnik"].sample, 
date_of_departure: DateTime.new(2020, rand(1..4), rand(1..28)), 
date_of_arrival: DateTime.new(2020, rand(5..9), rand(1..28)), 
convoy_price: rand(2000..10000)
=end