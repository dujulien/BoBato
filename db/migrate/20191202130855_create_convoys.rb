class CreateConvoys < ActiveRecord::Migration[5.2]
  def change
    create_table :convoys do |t|
    	t.references :boat_owner, index: true
      t.string :title
    	t.string :boat_type
    	t.string :required_license
      t.text :description
    	t.string :departure_port
    	t.string :arrival_port
    	t.datetime :date_of_departure
    	t.datetime :date_of_arrival
    	t.float :convoy_price
      t.timestamps
    end
  end
end
