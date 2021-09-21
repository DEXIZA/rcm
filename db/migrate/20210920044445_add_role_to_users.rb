class AddRoleToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :roll, :integer, null: false,default: 1
  end
end
