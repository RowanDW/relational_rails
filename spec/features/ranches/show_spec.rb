require 'rails_helper'

RSpec.describe 'the ranches show page' do
  it 'displays the ranch and its attributes' do
    ranch_1 = Ranch.create!(name: "Fernando's Fine Bovines", max_capacity: 50, certified_humane: true)
    ranch_2 = Ranch.create!(name: "Janie's Jolly Cow Corral", max_capacity: 80, certified_humane: false)

    visit "/ranches/#{ranch_1.id}"


    expect(page).to have_content("Fernando's Fine Bovines")
    expect(page).to have_content("Id: #{ranch_1.id}")
    expect(page).to have_content("Max Capacity: 50")
    expect(page).to have_content("Certified Humane: true")
    expect(page).to have_content("Created at: #{ranch_1.created_at}")
    expect(page).to have_content("Updated at: #{ranch_1.updated_at}")

    expect(page).to_not have_content("Janie's Jolly Cow Corral")
  end
end
