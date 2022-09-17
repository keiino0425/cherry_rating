class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :b_rule_game, :integer
    add_column :users, :b_rule_first_place, :integer
    add_column :users, :b_rule_second_place, :integer
    add_column :users, :b_rule_third_place, :integer
    add_column :users, :b_rule_rating, :integer
  end
end
