# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar", 
             admin: true, 
             activated: true, 
             activated_at: Time.zone.now)

User.create!(name:  "Me!",
             email: "dawn@example.com",
             password:              "foobar",
             password_confirmation: "foobar", 
             admin: true, 
             activated: true, 
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password, 
               activated: true, 
               activated_at: Time.zone.now)
end

user = User.first()

#MyLists
listTitles = [ 
  "Holiday Favorites", 
  "Fats Waller", 
  "Duke Ellington", 
  "For the kids", 
  "Things to learn next"
  ]

listTitles.each { |title| user.lists.create!(title: title) }

songs = [
  "Winter Wonderland", 
  "White Christmas", 
  "I'll see you in my Dreams", 
  "Solitude", 
  "I Got it bad (And that Ain't Good)", 
  "You Are My Sunshine",
]

songs.each { |title| user.items.create!(title: title) }

#make one association to get us started
list = user.lists.first()
song = user.items.first()
list.list_items.create!(item_id: song.id)

