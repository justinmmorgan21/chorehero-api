class CreateChildChores < ActiveRecord::Migration[7.1]
  def change
    create_table :child_chores do |t|
      t.integer :child_id
      t.integer :chore_id
      t.boolean :active
      t.date :date_activated
      t.date :date_inactivated
      t.boolean :done_mon
      t.boolean :done_tue
      t.boolean :done_wed
      t.boolean :done_thu
      t.boolean :done_fri
      t.boolean :done_sat
      t.boolean :done_sun
      t.boolean :done_weekly

      t.timestamps
    end
  end
end
