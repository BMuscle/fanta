class AddColumnUserHash < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_hash, :string
  end
end
