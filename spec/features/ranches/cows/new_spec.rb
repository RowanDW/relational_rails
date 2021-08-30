require 'rails_helper'

RSpec.describe 'new cow creation' do
  before(:each) do
    @ranch_1 = Ranch.create!(name: "Fernando's Fine Bovines", max_capacity: 50, certified_humane: true)
    @cow_1 = @ranch_1.cows.create!(name: "Bessie Lou", age: 2, grass_fed: true)
    @cow_2 = @ranch_1.cows.create!(name: "Bobbie Jean", age: 4, grass_fed: true)
  end

  it 'links to all child indexes' do
    visit "/ranches/#{@ranch_1.id}/cows/new"

    expect(page).to have_content("Crops Index")
    expect(page).to have_content("Cows Index")

    click_on "Crops Index"
    expect(current_path).to eq("/crops")

    visit "/ranches/#{@ranch_1.id}/cows/new"

    click_on "Cows Index"
    expect(current_path).to eq("/cows")
  end

  it 'links to all parent indexes' do
    visit "/ranches/#{@ranch_1.id}/cows/new"

    expect(page).to have_content("Farms Index")
    expect(page).to have_content("Ranches Index")

    click_on "Farms Index"
    expect(current_path).to eq("/farms")

    visit "/ranches/#{@ranch_1.id}/cows/new"

    click_on "Ranches Index"
    expect(current_path).to eq("/ranches")
  end

  it 'displays a link to make a new cow' do
    visit "/ranches/#{@ranch_1.id}/cows"

    click_link('New Cow')
    expect(current_path).to eq("/ranches/#{@ranch_1.id}/cows/new")
  end

  it 'can create a new ranch cow' do
    visit "/ranches/#{@ranch_1.id}/cows/new"

    fill_in("name", with: "Suzie Moo")
    fill_in("age",  with: 5)
    check("grass_fed")

    click_button('Create Cow')

    expect(current_path).to eq("/ranches/#{@ranch_1.id}/cows")
    expect(page).to have_content("Suzie Moo")
  end
end
