class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :white_player_id, index: true
      t.integer :black_player_id, index: true
      t.integer :winning_player_id
      t.string :name
      t.timestamps
    end
  end
end
