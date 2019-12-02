class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
    	t.belongs_to :skipper
    	t.belongs_to :convoy
    	t.string :stripe_id
      t.timestamps
    end
  end
end
