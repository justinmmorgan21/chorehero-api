class CreateChildren < ActiveRecord::Migration[7.1]
  def change
    create_table :children do |t|
      t.integer :parent_id
      t.string :name
      t.string :username
      t.string :password_digest
      t.date :birthdate
      t.integer :points_available

      t.timestamps
    end
  end
end
