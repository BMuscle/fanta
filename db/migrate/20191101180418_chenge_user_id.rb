class ChengeUserId < ActiveRecord::Migration[5.2]
  def up
    remove_column :rankings, :user_id
    add_reference :rankings, :user
  end

  def down
    remove_column :rankings, :user_id
    add_column :rankings, :user_id, :integer
  end
end
