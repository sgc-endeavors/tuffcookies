class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :deck_id
      t.string :name
      t.string :card_type
      t.string :status
      t.integer :owner
      t.integer :order_in_deck

      t.timestamps
    end
  end
end
