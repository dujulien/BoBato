class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
    	t.belongs_to :skipper
    	t.belongs_to :convoy
      t.timestamps
    end
  end
end
