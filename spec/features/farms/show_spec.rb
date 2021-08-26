require 'rails_helper'

# As a visitor When I visit a parent's show page I see a count of the number
# of children associated with this parent

RSpec.describe 'the farms show page' do

  before :each do
    @farm1 = Farm.create!(name: "Schrute Farms", acres: 40, organic: true)
    @farm2 = Farm.create!(name: "Old MacDonald's", acres: 100, organic: false)
    @farm3 = Farm.create!(name: "Farmy Farm", acres: 120, organic: true)
    @crop1 = @farm1.crops.create!(name: 'Tomatoes', yield: 30, annual: true)
    @crop2 = @farm2.crops.create!(name: 'Beans', yield: 65, annual: true)
    @crop3 = @farm1.crops.create!(name: 'Peaches', yield: 25, annual: false)
  end

  it 'can see all the attributes of the farm' do

    visit "/farms/#{@farm1.id}"

    expect(page).to have_content(@farm1.name)
    expect(page).to have_content(@farm1.acres)
    expect(page).to have_content(@farm1.organic)
    expect(page).to have_content(@farm1.updated_at)
    expect(page).to have_content(@farm1.created_at)
    expect(page).to have_content(@farm1.id)

    expect(page).to_not have_content(@farm2.name)
  end

  it 'can see the child crops count of the farm' do
    visit "/farms/#{@farm1.id}"

    expect(page).to have_content("Number of Crops: 2")

    visit "/farms/#{@farm2.id}"

    expect(page).to have_content("Number of Crops: 1")

    visit "/farms/#{@farm3.id}"

    expect(page).to have_content("Number of Crops: 0")
  end

  it 'links to all child indexes' do
    visit "/farms/#{@farm1.id}"

    expect(page).to have_content("Crops Index")
    expect(page).to have_content("Cows Index")

    click_on "Crops Index"
    expect(current_path).to eq("/crops")

    visit "/farms/#{@farm1.id}"

    click_on "Cows Index"
    expect(current_path).to eq("/cows")
  end

  it 'links to all parent indexes' do
    visit "/farms/#{@farm1.id}"

    expect(page).to have_content("Farms Index")
    expect(page).to have_content("Ranches Index")

    click_on "Farms Index"
    expect(current_path).to eq("/farms")

    visit "/farms/#{@farm1.id}"

    click_on "Ranches Index"
    expect(current_path).to eq("/ranches")
  end
end
