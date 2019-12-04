class Convoy < ApplicationRecord
	belongs_to :boat_owner
	has_one :delivery
	has_many :submissions
	has_many :applicants, through: :submissions, :source => :skipper
	has_many_attached :pictures
	
	validates :date_of_departure, presence: { message: "Il n'y a pas de date de départ"} 
  validates :date_of_arrival, presence: { message: "Il n'y a pas de date d'arrivée"}
  validates :convoy_price, presence: { message: "Il n'y a pas de prix"} 
  validates :convoy_price, numericality: { greater_than: 0 , message: "Le prix doit être supérieur à 0"}
  validate :departure_must_be_before_arrival
  validate :departure_must_be_in_future


	private

	def departure_must_be_before_arrival
	  return unless date_of_departure and date_of_arrival
	  errors.add(:date_of_departure, "La date de départ doit être avant la date d'arrivée") unless date_of_departure < date_of_arrival
	end

	def departure_must_be_in_future
    errors.add(:date_of_departure, "La date de départ doit être supérieure à la date du jour") if date_of_departure < Time.now
  end


end
