class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :game_id
      t.integer :player_order
      t.integer :player_correct_guesses

      t.timestamps
    end
  end
end
