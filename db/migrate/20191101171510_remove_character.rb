class RemoveCharacter < ActiveRecord::Migration[5.2]
  def change
      1.upto(4) do |i|
      remove_column :rankings, "character#{i}_id".to_sym
    end
  end
end
