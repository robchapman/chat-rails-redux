# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Delete previous
puts('Clearing Database...')
Message.destroy_all
User.destroy_all
Channel.destroy_all
puts('Database cleared.')

# Create Channels
puts('Creating Channels...')
channels = [
  {name: "general"},
  {name: "react"},
  {name: "london"},
  {name: "paris"}
]
channels.map! do |channel|
  Channel.create!(channel)
end
puts('Channels created.')

# Create Users
puts('Creating Users...')
users = [
  {email: "rob@email.com", password: "password" },
  {email: "amelia@email.com", password: "password" },
  {email: "lauren@email.com", password: "password" }
]
users.map! do |user|
  User.create!(user)
end
puts('Users created.')

# Create Messages
puts('Creating Messages...')
messages = [
  {user: users[0], channel: channels[0], content: "Hi guys!"},
  {user: users[1], channel: channels[0], content: "hey :)"},
  {user: users[2], channel: channels[0], content: "wassup"},
  {user: users[0], channel: channels[0], content: "Hope this thing works"},
  {user: users[1], channel: channels[0], content: "me too"},
  {user: users[0], channel: channels[1], content: "Hi guys! Different Channel"},
  {user: users[1], channel: channels[1], content: "Yeh not bad"},
  {user: users[2], channel: channels[1], content: "prefered the other one"},
  {user: users[0], channel: channels[1], content: "wow"},
  {user: users[1], channel: channels[1], content: "wowee"},
  {user: users[0], channel: channels[2], content: "and another one"},
  {user: users[1], channel: channels[2], content: "we could also have a chat in here"},
]

messages.each do |message|
  Message.create!(message)
end
puts('Messages created.')
