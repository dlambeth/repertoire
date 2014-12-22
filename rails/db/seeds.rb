# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create([
  {name: 'dawn', 
    email: 'dawn@mail.com',
   password: '12345678', password_confirmation: '12345678'},
  {name: 'pink',
   email: 'pink@mail.com',
   password: '12345678', password_confirmation: '12345678'}
]) 

user = User.first()

#MyLists
lists = [ 
  "Starting List",
  "Holiday Favorites", 
  "Fats Waller", 
  "Duke Ellington", 
  "For the kids", 
  "Things to learn next"
  ]

lists.each { |title| user.lists.create!(title: title) }

songs = [
  "Winter Wonderland", 
  "White Christmas", 
  "I'll see you in my Dreams", 
  "Solitude", 
  "I Got it bad (And that Ain't Good)", 
  "Day Dream",
  "You Are My Sunshine"
]

#add each song to the db, and add them all to a single list so we have something to play with
list = user.lists.first()
songs.each do |title| 
  user.items.create!(title: title) 
  
end

list.list_items.create!(item_id: user.items.first().id)
list.list_items.create!(item_id: user.items.last().id)
list.save



