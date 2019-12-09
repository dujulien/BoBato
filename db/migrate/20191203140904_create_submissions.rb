class CreateSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :submissions do |t|
    	t.references :skipper, index: true
    	t.belongs_to :convoy
    	t.boolean :status
    	t.text :cover_text
      t.timestamps
    end
  end
end
