# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#a
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

naya = User.create!(email: "willisnaya@gmail.com", password: "password", password_confirmation: "password")
marissa = User.create!(email: "mjoseph@gmail.com", password: "password", password_confirmation: "password")
emoji1 = Emoji.create!(slug: "victory-hand", character: "✌️")
emoji2 = Emoji.create!(slug: "vulcan-salute", character: "🖖")

naya.emojis << emoji1
naya.emojis << emoji2
marissa.emojis << emoji1
marissa.emojis << emoji2