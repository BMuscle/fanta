require "csv"
CSV.foreach("tool/character.csv") do |row|
  # use row here...
  Character.create!(name: row[1])
end