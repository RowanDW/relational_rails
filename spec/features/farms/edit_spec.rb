require 'rails_helper'

RSpec.describe 'edit farm page' do
  before :each do
    @farm = Farm.create!(name: "Shrut Farms", acres: 40, organic: true)
  end

  it 'links to all child indexes' do
    visit "/farms/#{@farm.id}/edit"

    expect(page).to have_content("Crops Index")
    expect(page).to have_content("Cows Index")

    click_on "Crops Index"
    expect(current_path).to eq("/crops")

    visit "/farms/#{@farm.id}/edit"

    click_on "Cows Index"
    expect(current_path).to eq("/cows")
  end

  it 'links to all parent indexes' do
    visit "/farms/#{@farm.id}/edit"

    expect(page).to have_content("Farms Index")
    expect(page).to have_content("Ranches Index")

    click_on "Farms Index"
    expect(current_path).to eq("/farms")

    visit "/farms/#{@farm.id}/edit"

    click_on "Ranches Index"
    expect(current_path).to eq("/ranches")
  end

  it 'links from farm show to farm edit page' do
    visit "/farms/#{@farm.id}"

    click_button "Edit #{@farm.name}"
    expect(current_path).to eq("/farms/#{@farm.id}/edit")
  end

  it 'can edit the farm' do
    visit "/farms/#{@farm.id}"
    expect(page).to have_content("Shrut Farms")

    click_button "Edit Shrut Farms"

    fill_in 'Name', with: "Schrute Farms"
    fill_in 'Acres', with: 80
    check 'organic'
    click_button 'Update Farm'

    expect(current_path).to eq("/farms/#{@farm.id}")
    expect(page).to have_content("Schrute Farms")
  end
end
