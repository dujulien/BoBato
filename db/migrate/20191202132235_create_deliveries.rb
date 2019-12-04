class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
    	t.references :skipper, index: true
    	t.references :convoy
    	t.string :stripe_id
      t.timestamps
    end
  end
end
