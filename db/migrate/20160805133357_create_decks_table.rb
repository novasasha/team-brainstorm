class CreateDecksTable < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string   :topic, null: false

      t.timestamps(null: false)
    end
  end
end
