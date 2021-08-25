require 'rails_helper'

RSpec.describe 'Ranches index' do
  before(:each) do
    @ranch_1 = Ranch.create!(name: "Fernando's Fine Bovines", max_capacity: 50, certified_humane: true)
    @ranch_2 = Ranch.create!(name: "Janie's Jolly Cow Corral", max_capacity: 80, certified_humane: false)
  end

  it 'displays the name of each ranch' do
    visit "/ranches"

    expect(page).to have_content("Fernando's Fine Bovines")
    expect(page).to have_content("Janie's Jolly Cow Corral")

    expect(page).to have_content("Max Capacity: 50")
    expect(page).to have_content("Max Capacity: 80")

    expect(page).to have_content("Certified Humane: true")
    expect(page).to have_content("Certified Humane: false")
  end
end
