class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :app_name, default:'ANA ERP', null:false
      t.string :app_description, default:'', null:false
      t.string :author, default:''

      t.timestamps
    end
  end
end
