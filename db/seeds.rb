# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


1.times {
  c = User.new(first_name: "Admin", last_name: "Admin", email:"admin@smartbits.cz", password: "paegas", password_confirmation: "paegas")
  c.confirm
  c.role = 3
  c.save
}
10.times { |n|
  c = User.new(first_name: "Manažer #{n}", last_name: "Last #{n}", email:"manager#{n}@smartbits.cz", password: "paegas", password_confirmation: "paegas")
  c.confirm
  c.role = 2
  c.save
}
50.times { |n| Project.create(user_id: "#{rand(5..30).to_i}", title: "Projekt #{n}", description: "Lorem ipsum dolor sit amet", public: true) }

25.times { |n| 
  c = User.new(first_name: "User - #{n}", last_name: "Last_#{n}", email:"user#{n}@smartbits.cz", password: "paegas", password_confirmation: "paegas")
  c.confirm
}