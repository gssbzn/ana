class CreateMines < ActiveRecord::Migration
  def change
    create_table :mines do |t|
      t.string :name
      t.text :description
      t.float :latitude
      t.float :longitude
      t.decimal :expected_capacity
      t.decimal :real_capacity

      t.timestamps
    end
    add_index :mines, :name, unique: true
  end
end
