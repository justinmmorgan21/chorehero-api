class CreateUsedRewards < ActiveRecord::Migration[7.1]
  def change
    create_table :used_rewards do |t|
      t.integer :child_id
      t.integer :reward_id
      t.date :date_approved

      t.timestamps
    end
  end
end
