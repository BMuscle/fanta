require "csv"
CSV.foreach("tool/character.csv") do |row|
  # use row here...
  Character.create!(id: row[0], name: row[1])
end