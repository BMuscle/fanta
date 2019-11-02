open('tool/UserID.csv', "r") do |f|
  f.each_line do |l|
    User.create!(name: "unknown", user_hash: l.chomp)
  end
end
