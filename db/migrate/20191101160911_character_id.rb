class CharacterId < ActiveRecord::Migration[5.2]
  def change
    1.upto(4) do |i|
      remove_column :rankings, "character_id#{i}".to_sym
    end
  end
end
