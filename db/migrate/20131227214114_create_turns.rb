class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.integer :game_id
      t.string :player_guess
      t.string :card_in_play
      t.string :flipped_card
      t.integer :player_order_number

      t.timestamps
    end
  end
end
