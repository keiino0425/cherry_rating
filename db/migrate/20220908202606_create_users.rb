class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password
      t.integer :chip
      t.integer :winning_streak
      t.integer :point
      t.integer :a_rule_game
      t.integer :a_rule_first_place
      t.integer :a_rule_second_place
      t.integer :a_rule_third_place
      t.integer :a_rule_rating

      t.timestamps
    end
  end
end
