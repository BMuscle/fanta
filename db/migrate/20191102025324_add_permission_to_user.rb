class AddPermissionToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :permisson, :string
  end
end
