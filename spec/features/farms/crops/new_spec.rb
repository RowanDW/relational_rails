require 'rails_helper'

RSpec.describe 'Create a new farm crop' do

  before :each do
    @farm = Farm.create!(name: "Schrute Farms", acres: 40, organic: true)
  end

  it 'links to all child indexes' do
    visit "/farms/#{@farm.id}/crops/new"

    expect(page).to have_content("Crops Index")
    expect(page).to have_content("Cows Index")

    click_on "Crops Index"
    expect(current_path).to eq("/crops")

    visit "/farms/#{@farm.id}/crops/new"

    click_on "Cows Index"
    expect(current_path).to eq("/cows")
  end

  it 'links to all parent indexes' do
    visit "/farms/#{@farm.id}/crops/new"

    expect(page).to have_content("Farms Index")
    expect(page).to have_content("Ranches Index")

    click_on "Farms Index"
    expect(current_path).to eq("/farms")

    visit "/farms/#{@farm.id}/crops/new"

    click_on "Ranches Index"
    expect(current_path).to eq("/ranches")
  end

  it 'links from farm crop index page to new' do
    visit "/farms/#{@farm.id}/crops"

    expect(page).to have_content('New Schrute Farms Crop')
    click_on 'New Schrute Farms Crop'
    expect(current_path).to eq("/farms/#{@farm.id}/crops/new")
  end

  it 'can create a new farm crop' do
    visit "/farms/#{@farm.id}/crops/new"

    fill_in('Name', with: "Tomato")
    fill_in('Yield', with: 25)
    check 'annual'

    click_button('Create Schrute Farms Crop')

    expect(current_path).to eq("/farms/#{@farm.id}/crops")
    expect(page).to have_content("Tomato")
  end
end
