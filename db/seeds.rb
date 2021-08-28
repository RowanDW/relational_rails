# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Farm.destroy_all
Ranch.destroy_all

farm1 = Farm.create!(name: "Schrute Farms", acres: 40, organic: true)
farm2 = Farm.create!(name: "Old MacDonald's", acres: 100, organic: false)
farm3 = Farm.create!(name: "Farmy Farm", acres: 120, organic: true)
crop1 = farm1.crops.create!(name: 'Tomatoes', yield: 30, annual: true)
crop2 = farm2.crops.create!(name: 'Beans', yield: 65, annual: true)
crop3 = farm1.crops.create!(name: 'Peaches', yield: 25, annual: false)

ranch_1 = Ranch.create!(name: "Fernando's Fine Bovines", max_capacity: 50, certified_humane: true)
cow_1 = ranch_1.cows.create!(name: "Bessie Lou", age: 2, grass_fed: true)
cow_2 = ranch_1.cows.create!(name: "Bobbie Jean", age: 4, grass_fed: true)

ranch_2 = Ranch.create!(name: "Janie's Jolly Cow Corral", max_capacity: 80, certified_humane: false)
cow_3 = ranch_2.cows.create!(name: "Spotty Sue", age: 3, grass_fed: false)
