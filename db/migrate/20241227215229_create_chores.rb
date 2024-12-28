class CreateChores < ActiveRecord::Migration[7.1]
  def change
    create_table :chores do |t|
      t.integer :parent_id
      t.string :title
      t.text :description
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      t.boolean :one_timer
      t.integer :points_awarded

      t.timestamps
    end
  end
end
