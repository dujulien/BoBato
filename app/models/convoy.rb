class Convoy < ApplicationRecord
	
  has_many_attached :pictures

	belongs_to :boat_owner, class_name: 'User'
	has_one :delivery
	has_many :submissions
	has_many :applicants, through: :submissions, :source => :skipper

	validates :date_of_departure, presence: { message: "Il n'y a pas de date de départ"}
  validates :date_of_arrival, presence: { message: "Il n'y a pas de date d'arrivée"}
  validates :convoy_price, presence: { message: "Il n'y a pas de prix"}
  validates :convoy_price, numericality: { greater_than: 0 , message: "Le prix doit être supérieur à 0"}
  validate :departure_must_be_in_future
  validate :departure_must_be_before_arrival
  after_create :convoy_conf_email_send,
  
  
  def duration
  	(self.date_of_arrival - self.date_of_departure)/(60*60*24).round(0)
  end

  def convoy_conf_email_send
    UserMailer.convoy_conf_email(self).deliver_now
  end


	def departure_must_be_in_future
    errors.add(:date_of_departure, "La date de départ doit être supérieure à la date du jour") if date_of_departure < Time.now
  end


	def departure_must_be_before_arrival
	  return unless date_of_departure and date_of_arrival
	  errors.add(:date_of_departure, "La date de départ doit être avant la date d'arrivée") unless date_of_departure < date_of_arrival
	end


end
