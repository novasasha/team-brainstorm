class Guesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.string   :content
      t.integer  :game_id, null: false
      t.integer  :card_id, null: false
      t.integer  :correct, null: false
      t.timestamps(null: false)
    end
  end
end
