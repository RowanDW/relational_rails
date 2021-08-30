require 'rails_helper'

RSpec.describe 'new Ranch creation' do
  it 'links to all child indexes' do
    visit "/ranches/new"

    expect(page).to have_content("Crops Index")
    expect(page).to have_content("Cows Index")

    click_on "Crops Index"
    expect(current_path).to eq("/crops")

    visit "/ranches/new"

    click_on "Cows Index"
    expect(current_path).to eq("/cows")
  end

  it 'links to all parent indexes' do
    visit "/ranches/new"

    expect(page).to have_content("Farms Index")
    expect(page).to have_content("Ranches Index")

    click_on "Farms Index"
    expect(current_path).to eq("/farms")

    visit "/ranches/new"

    click_on "Ranches Index"
    expect(current_path).to eq("/ranches")
  end

  it 'displays a link to make a new ranch' do
    visit "/ranches"

    click_link('New Ranch')
    expect(current_path).to eq('/ranches/new')
  end

  it 'can create a new ranch' do
    visit "/ranches/new"

    fill_in("name",         with: "Fernando's Fine Bovines")
    fill_in("max_capacity", with: 50)
    check("certified_humane")

    click_button('Create Ranch')

    ranch_id = Ranch.last.id

    expect(current_path).to eq("/ranches")
    expect(page).to have_content("Fernando's Fine Bovines")
  end
end
