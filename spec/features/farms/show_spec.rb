require 'rails_helper'

RSpec.describe 'the farms show page' do

  it 'can see all the attributes of the farm' do
    farm = Farm.create!(name: "Schrute Farms", acres: 40, organic: true)
    farm2 = Farm.create!(name: "Old MacDonald's", acres: 100, organic: false)

    visit "/farms/#{farm.id}"

    expect(page).to have_content(farm.name)
    expect(page).to have_content(farm.acres)
    expect(page).to have_content(farm.organic)
    expect(page).to have_content(farm.updated_at)
    expect(page).to have_content(farm.created_at)
    expect(page).to have_content(farm.id)

    expect(page).to_not have_content(farm2.name)
  end

end
