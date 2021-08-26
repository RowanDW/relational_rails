# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes:

require 'rails_helper'

RSpec.describe 'the cows show page' do
  it 'displays the cow and its attributes' do
    ranch_1 = Ranch.create!(name: "Fernando's Fine Bovines", max_capacity: 50, certified_humane: true)
    cow_1 = ranch_1.cows.create!(name: "Bessie Lou", age: 2, grass_fed: true)
    cow_2 = ranch_1.cows.create!(name: "Bobbie Jean", age: 4, grass_fed: true)

    visit "/cows/#{cow_1.id}"

    expect(page).to have_content("Bessie Lou")
    expect(page).to have_content("Age: 2")
    expect(page).to have_content("Grass fed?: true")
    expect(page).to have_content("Ranch id: #{ranch_1.id}")
    expect(page).to have_content("Created at: #{cow_1.created_at}")
    expect(page).to have_content("Updated at: #{cow_1.updated_at}")

    expect(page).to_not have_content("Bobbie Jean")
  end
end
