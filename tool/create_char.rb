require "csv"
CSV.foreach("tool/character.csv", encoding: "SJIS:UTF-8") do |row|
  # use row here...
  Character.create!(id: row[0], job_id: row[1], name: row[2], hp: row[3], power: row[4], generic1: row[5], generic2: row[6])
end