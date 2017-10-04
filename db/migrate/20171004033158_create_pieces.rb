class CreatePieces < ActiveRecord::Migration[5.0]
  def change
    create_table :pieces do |t|
      t.integer :id
      t.integer :user_id
      t.string :type
      t.timestamps
    end
  end
end
