require 'rails_helper'

RSpec.describe 'displays name of each crop in database' do
  it 'displays the name of each crop' do
    farm = Farm.create!(name: "Shrute Farms", acres: 40, organic: true)
    farm2 = Farm.create!(name: "Old MacDonald's", acres: 80, organic: false)
    crop1 = farm.crops.create!(name: 'Tomatoes', yield: 30, annual: true)
    crop2 = farm2.crops.create!(name: 'Beans', yield: 65, annual: true)
    crop3 = farm.crops.create!(name: 'Peaches', yield: 25, annual: false)

    visit "/farms/#{farm.id}/crops"
    
    expect(page).to have_content(crop1.name)
    expect(page).to have_content(crop3.name)
    expect(page).to_not have_content(crop2.name)
  end

  it 'displays the yield of each crop' do
    farm = Farm.create!(name: "Shrute Farms", acres: 40, organic: true)
    farm2 = Farm.create!(name: "Old MacDonald's", acres: 80, organic: false)
    crop1 = farm.crops.create!(name: 'Tomatoes', yield: 30, annual: true)
    crop2 = farm2.crops.create!(name: 'Beans', yield: 65, annual: true)

    visit "/farms/#{farm.id}/crops"

    expect(page).to have_content(crop1.yield)
    expect(page).to_not have_content(crop2.yield)
  end

  it 'displays the annual status of each crop' do
    farm = Farm.create!(name: "Shrute Farms", acres: 40, organic: true)
    farm2 = Farm.create!(name: "Old MacDonald's", acres: 80, organic: false)
    crop1 = farm.crops.create!(name: 'Tomatoes', yield: 30, annual: true)
    crop2 = farm2.crops.create!(name: 'Beans', yield: 65, annual: true)

    visit "/farms/#{farm.id}/crops"

    expect(page).to have_content(crop1.annual)

  end

  it 'displays the farm id of each crop' do
    farm = Farm.create!(name: "Shrute Farms", acres: 40, organic: true)
    farm2 = Farm.create!(name: "Old MacDonald's", acres: 80, organic: false)
    crop1 = farm.crops.create!(name: 'Tomatoes', yield: 30, annual: true)
    crop2 = farm2.crops.create!(name: 'Beans', yield: 65, annual: true)

    visit "/farms/#{farm.id}/crops"

    expect(page).to have_content(crop1.farm_id)
    expect(page).to_not have_content(crop2.farm_id)
  end

  it 'displays the updated at time of each crop' do
    farm = Farm.create!(name: "Shrute Farms", acres: 40, organic: true)
    farm2 = Farm.create!(name: "Old MacDonald's", acres: 80, organic: false)
    crop1 = farm.crops.create!(name: 'Tomatoes', yield: 30, annual: true)
    crop2 = farm2.crops.create!(name: 'Beans', yield: 65, annual: true)

    visit "/farms/#{farm.id}/crops"

    expect(page).to have_content(crop1.updated_at)

  end

  it 'displays the created at time of each crop' do
    farm = Farm.create!(name: "Shrute Farms", acres: 40, organic: true)
    farm2 = Farm.create!(name: "Old MacDonald's", acres: 80, organic: false)
    crop1 = farm.crops.create!(name: 'Tomatoes', yield: 30, annual: true)
    crop2 = farm2.crops.create!(name: 'Beans', yield: 65, annual: true)

    visit "/farms/#{farm.id}/crops"

    expect(page).to have_content(crop1.created_at)

  end

  it 'displays the id of each crop' do
    farm = Farm.create!(name: "Shrute Farms", acres: 40, organic: true)
    farm2 = Farm.create!(name: "Old MacDonald's", acres: 80, organic: false)
    crop1 = farm.crops.create!(name: 'Tomatoes', yield: 30, annual: true)
    crop2 = farm2.crops.create!(name: 'Beans', yield: 65, annual: true)

    visit "/farms/#{farm.id}/crops"

    expect(page).to have_content(crop1.id)
    expect(page).to_not have_content(crop2.id)
  end
end
