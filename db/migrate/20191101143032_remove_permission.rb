class RemovePermission < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :permissions
  end
end
