class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :direction
      t.integer :consecutive_correct_guesses

      t.timestamps
    end
  end
end
