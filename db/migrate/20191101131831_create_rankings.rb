class CreateRankings < ActiveRecord::Migration[5.2]
  def change
    create_table :rankings do |t|
      t.integer :user_id
      t.string :music_name
      t.integer :score
      t.integer :damage
      t.integer :character_id1
      t.integer :character_id2
      t.integer :character_id3
      t.integer :character_id4

      t.timestamps
    end
  end
end
