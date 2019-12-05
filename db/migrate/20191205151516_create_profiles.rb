class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :birthdate
      t.string :city
      t.text :description
      t.belongs_to :user, index: true #cette ligne rajoute la référence à la table users

      t.timestamps
    end
  end
end
