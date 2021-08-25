# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:
require 'rails_helper'

RSpec.describe '#the cows index page' do
  it 'displays all cows with their attributes' do
    ranch_1 = Ranch.create!(name: "Fernando's Fine Bovines", max_capacity: 50, certified_humane: true)
    cow_1 = ranch_1.cows.create!(name: "Bessie Lou", age: 2, grass_fed: true)
    cow_2 = ranch_1.cows.create!(name: "Bobbie Jean", age: 4, grass_fed: true)

    ranch_2 = Ranch.create!(name: "Janie's Jolly Cow Corral", max_capacity: 80, certified_humane: false)
    cow_3 = ranch_2.cows.create!(name: "Spotty Sue", age: 3, grass_fed: false)

    visit '/cows'

    expect(page).to have_content("Bessie Lou")
    expect(page).to have_content("Bobbie Jean")
    expect(page).to have_content("Spotty Sue")

    expect(page).to have_content("Age: 2")
    expect(page).to have_content("Age: 4")
    expect(page).to have_content("Age: 3")

    expect(page).to have_content("Grass fed: true")
    expect(page).to have_content("Grass fed: false")

    expect(page).to have_content("Ranch id: #{ranch_1.id}")
    expect(page).to have_content("Ranch id: #{ranch_2.id}")

    expect(page).to have_content("Created at: #{cow_1.created_at}")
    expect(page).to have_content("Created at: #{cow_2.created_at}")
    expect(page).to have_content("Created at: #{cow_3.created_at}")

    expect(page).to have_content("Updated at: #{cow_1.updated_at}")
    expect(page).to have_content("Updated at: #{cow_2.updated_at}")
    expect(page).to have_content("Updated at: #{cow_3.updated_at}")
  end
end
