class AtColumnCharacters < ActiveRecord::Migration[5.2]
  def change
    add_reference :rankings, :character1, foreign_key: true
    add_reference :rankings, :character2, foreign_key: true
    add_reference :rankings, :character3, foreign_key: true
    add_reference :rankings, :character4, foreign_key: true
  end
end
