class CreatePieces < ActiveRecord::Migration[5.0]
  def change
    create_table :pieces do |t|
      t.integer :user_id, index: true
      t.integer :game_id, index: true
      t.string :type
      t.integer :position_x
      t.integer :position_y
      t.timestamps
    end
  end
end
