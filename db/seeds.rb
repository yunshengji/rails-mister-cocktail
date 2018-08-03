# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

buffer = open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read
result = JSON.parse(buffer)
result["drinks"].each_with_index do |ingredient, i|
  if i < 8
  Ingredient.create(name: ingredient["strIngredient1"])
  end
end

Cocktail.create(name: "Margarita")
Cocktail.create(name: "Martini")
Cocktail.create(name: "Manhattan")
Cocktail.create(name: "Brooklyn")
Dose.create(cocktail_id: 1, ingredient_id: 1,description: "the Margarita cocktail needs 6cl of lemon")
Dose.create(cocktail_id: 1, ingredient_id: 2,description: "the Margarita cocktail needs 2cl of water")
Dose.create(cocktail_id: 2, ingredient_id: 2,description: "the Martini cocktail needs 5cl of sugar")
