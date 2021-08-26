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
  end

  it 'orders by most recently created' do
    visit "/ranches"

    expect("Janie's Jolly Cow Corral").to appear_before("Fernando's Fine Bovines")
  end

  it 'displays created_at next to each record' do
    visit "/ranches"

    expect(page).to have_content(@ranch_1.created_at)
    expect(page).to have_content(@ranch_2.created_at)
  end

  it 'links to all child indexes' do
    visit "/ranches"

    expect(page).to have_content("Crops Index")
    expect(page).to have_content("Cows Index")

    click_on "Crops Index"
    expect(current_path).to eq("/crops")

    visit "/ranches"

    click_on "Cows Index"
    expect(current_path).to eq("/cows")
  end

  it 'links to all parent indexes' do
    visit "/ranches"

    expect(page).to have_content("Farms Index")
    expect(page).to have_content("Ranches Index")

    click_on "Farms Index"
    expect(current_path).to eq("/farms")

    visit "/ranches"

    click_on "Ranches Index"
    expect(current_path).to eq("/ranches")
  end
end
