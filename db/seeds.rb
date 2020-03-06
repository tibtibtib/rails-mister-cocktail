# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

puts 'cleaning...'
Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

puts 'creating ingredients'
url = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
ingredients = JSON.parse(url)
ingredients["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
end

# Ingredient.create!(name: "lemon")
# Ingredient.create!(name: "ice")
# Ingredient.create!(name: "mint leaves")
# Ingredient.create!(name: "vodka")
# Ingredient.create!(name: "rhum")
# Ingredient.create!(name: "tequila")
# Ingredient.create!(name: "orange juice")
# Ingredient.create!(name: "tomato juice")

# puts "creating cocktails"

# file = URI.open('https://turbigo-gourmandises.fr/wp-content/uploads/2017/08/cocktail-bloody-mary-maison.jpg')
# bm = Cocktail.add(name: "Bloody Mary")
# bm.photo.attach(io: file, filename: 'bloody_mary.jpg', content_type: 'image/jpg')
# bm.save!

# file2 = URI.open('https://assets.afcdn.com/recipe/20180705/80255_w1024h768c1cx2774cy1849cxt0cyt0cxb5541cyb3691.jpg')
# mojito = Cocktail.add(name: "Mojito")
# mojito.photo.attach(io: file2, filename: 'mojito.jpg', content_type: 'image/jpg')
# mojito.save!

# file3 = URI.open('https://assets.afcdn.com/recipe/20180705/80288_w1024h768c1cx1473cy1313cxt0cyt0cxb4493cyb3286.jpg')
# margarita = Cocktail.add(name: "Margarita")
# margarita.photo.attach(io: file3, filename: 'margarita.jpg', content_type: 'image/jpg')
# margarita.save!

puts "finished seeding"
