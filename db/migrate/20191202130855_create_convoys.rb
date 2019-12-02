class CreateConvoys < ActiveRecord::Migration[5.2]
  def change
    create_table :convoys do |t|
    	t.belongs_to :boat_owner
    	t.string :boat_type
    	t.string :required_license
    	t.string :departure_port
    	t.string :arrival_port
    	t.datetime :date_of_departure
    	t.datetime :date_of_arrival
    	t.float :convoy_price
      t.timestamps
    end
  end
end
