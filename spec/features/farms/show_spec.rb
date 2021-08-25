require 'rails_helper'

RSpec.describe 'displays the attributes of the farm' do
  it 'displays the name of the farm' do
    farm = Farm.create!(name: "Shrute Farms", acres: 40, organic: true)
    farm2 = Farm.create!(name: "Old MacDonald's", acres: 100, organic: false)

    visit "/farms/#{farm.id}"

    expect(page).to have_content(farm.name)
    expect(page).to_not have_content(farm2.name)
  end

  it 'displays the acres of the farm' do
    farm = Farm.create!(name: "Shrute Farms", acres: 40, organic: true)

    visit "/farms/#{farm.id}"

    expect(page).to have_content(farm.acres)
  end

  it 'displays the organic status of the farm' do
    farm = Farm.create!(name: "Shrute Farms", acres: 40, organic: true)

    visit "/farms/#{farm.id}"

    expect(page).to have_content(farm.organic)
  end

  it 'displays the updated at time of the farm' do
    farm = Farm.create!(name: "Shrute Farms", acres: 40, organic: true)

    visit "/farms/#{farm.id}"

    expect(page).to have_content(farm.updated_at)
  end

  it 'displays the created at time of the farm' do
    farm = Farm.create!(name: "Shrute Farms", acres: 40, organic: true)

    visit "/farms/#{farm.id}"

    expect(page).to have_content(farm.created_at)
  end

  it 'displays the id of the farm' do
    farm = Farm.create!(name: "Shrute Farms", acres: 40, organic: true)

    visit "/farms/#{farm.id}"
  
    expect(page).to have_content(farm.id)
  end
end
