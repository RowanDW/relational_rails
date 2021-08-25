require 'rails_helper'

RSpec.describe 'displays name of each crop in database' do
  it 'displays the name of each crop' do
    farm = Farm.create!(name: "Shrute Farms", acres: 40, organic: true)
    crop1 = farm.crops.create!(name: 'Tomatoes', yield: 30, annual: true)

    visit "/crops/#{crop1.id}"

    expect(page).to have_content(crop1.name)
  end

  it 'displays the yield of each crop' do
    farm = Farm.create!(name: "Shrute Farms", acres: 40, organic: true)
    crop1 = farm.crops.create!(name: 'Tomatoes', yield: 30, annual: true)

    visit "/crops/#{crop1.id}"

    expect(page).to have_content(crop1.yield)
  end

  it 'displays the annual status of each crop' do
    farm = Farm.create!(name: "Shrute Farms", acres: 40, organic: true)
    crop1 = farm.crops.create!(name: 'Tomatoes', yield: 30, annual: true)

    visit "/crops/#{crop1.id}"

    expect(page).to have_content(crop1.annual)
  end

  it 'displays the farm id of each crop' do
    farm = Farm.create!(name: "Shrute Farms", acres: 40, organic: true)
    crop1 = farm.crops.create!(name: 'Tomatoes', yield: 30, annual: true)

    visit "/crops/#{crop1.id}"

    expect(page).to have_content(crop1.farm_id)
  end

  it 'displays the updated at time of each crop' do
    farm = Farm.create!(name: "Shrute Farms", acres: 40, organic: true)
    crop1 = farm.crops.create!(name: 'Tomatoes', yield: 30, annual: true)

    visit "/crops/#{crop1.id}"

    expect(page).to have_content(crop1.updated_at)
  end

  it 'displays the created at time of each crop' do
    farm = Farm.create!(name: "Shrute Farms", acres: 40, organic: true)
    crop1 = farm.crops.create!(name: 'Tomatoes', yield: 30, annual: true)

    visit "/crops/#{crop1.id}"

    expect(page).to have_content(crop1.created_at)
  end

  it 'displays the id of each crop' do
    farm = Farm.create!(name: "Shrute Farms", acres: 40, organic: true)
    crop1 = farm.crops.create!(name: 'Tomatoes', yield: 30, annual: true)

    visit "/crops/#{crop1.id}"
    save_and_open_page
    expect(page).to have_content(crop1.id)
  end
end
