class AddNameLastnameToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, null: false, limit:50
    add_column :users, :lastname, :string, null: false, limit:50
  end
end
