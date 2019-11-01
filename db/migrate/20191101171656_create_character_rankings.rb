class CreateCharacterRankings < ActiveRecord::Migration[5.2]
  def change
    create_table :character_rankings do |t|

      t.references  :ranking,  index: true, foreign_key: true
      t.references  :character,  index: true, foreign_key: true
      t.timestamps
    end
  end
end
