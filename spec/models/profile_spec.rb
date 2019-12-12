require 'rails_helper'

RSpec.describe User, type: :model do
=begin
  before(:each) do 
    @user = User.create(email: "y_benatar@hotmail.com ", password: "foobar")
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end

    describe "#email" do
      it "should not be valid without email" do
        bad_user = User.create(email: "y_benatar@hotmail.com")
        expect(bad_user).not_to be_valid
        expect(bad_user.errors.include?(:email)).to eq(true)
      end
    end

    describe "#password" do
      it "should not be valid without password" do
        bad_user = User.create(password: "foobar")
        expect(bad_user).not_to be_valid
        expect(bad_user.errors.include?(:password)).to eq(false)
      end
    end

  end

  context "associations" do

    describe "profile" do
      it "should have_one profile" do
        profile = Profile.create(first_name: "Yoni", last_name: "Benatar", user_id: @user.id)
        expect(@user.profile.include?(profile)).to eq(true)
      end
    end

  end



  context "public instance methods" do

    describe "#first_name" do

      it "should return a string" do
        expect(@user.profile.first_name).to be_a(String)
      end

      it "should return the first name" do
        user_1 = User.create(email: "y_benatar@hotmail.com", password: "foobar")
        user_1.profile.first_name = "Yoni"
        expect(user_1.profile.first_name).to eq("Yoni")
        user_2 = User.create(email: "didier.gesnoin@hotmail.com", password: "foobar")
        user_2.profile.first_name = "Didier"
        expect(user_2.profile.first_name).to eq("Didier")
      end
    end

  end
=end
end