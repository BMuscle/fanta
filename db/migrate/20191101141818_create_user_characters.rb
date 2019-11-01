class CreateUserCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :user_characters do |t|
      t.references  :user,  index: true, foreign_key: true
      t.references  :character,  index: true, foreign_key: true
      t.timestamps
    end
  end
end
