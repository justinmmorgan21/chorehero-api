class AddMoneyBankedToChildren < ActiveRecord::Migration[7.1]
  def change
    add_column :children, :money_banked, :integer
  end
end
