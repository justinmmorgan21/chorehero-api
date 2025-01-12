class CreateRewards < ActiveRecord::Migration[7.1]
  def change
    create_table :rewards do |t|
      t.integer :parent_id
      t.string :title
      t.integer :points_cost
      t.boolean :active
      t.boolean :kid_requested

      t.timestamps
    end
  end
end
