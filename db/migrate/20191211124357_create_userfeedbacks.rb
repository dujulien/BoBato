class CreateUserfeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :userfeedbacks do |t|

      t.references :user, foreign_key: true
      t.references :profile, foreign_key: true
      t.integer :rating
      t.text  :comment


      t.timestamps
    end
  end
end
