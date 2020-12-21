# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Delete previous
puts('Clearing Database...')
Messages.destroy_all
Users.destroy_all
Channels.destroy_all
puts('Database cleared.')

# Create Channels
puts('Creating Channels...')
channels = [
  {name: "general"},
  {name: "react"},
  {name: "london"}
  {name: "paris"},
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
  {user: users[1], channel: channels[0], content: "me too"}
]

messages.each do |message|
  Channel.create!(channel)
end
puts('Messages created.')
