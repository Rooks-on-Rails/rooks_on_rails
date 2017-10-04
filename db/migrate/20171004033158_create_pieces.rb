class CreatePieces < ActiveRecord::Migration[5.0]
  def change
    create_table :pieces do |t|
      t.integer :id
      t.integer :user_id
      t.string :type
      t.integer :position_x
      t.integer :position_y
      t.timestamps
    end
  end
end
