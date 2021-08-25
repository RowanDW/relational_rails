require 'rails_helper'

RSpec.describe 'the crops show page' do

  it 'displays the attributes of the crop' do
    farm = Farm.create!(name: "Shrute Farms", acres: 40, organic: true)
    crop1 = farm.crops.create!(name: 'Tomatoes', yield: 30, annual: true)
    crop2 = farm.crops.create!(name: 'Beans', yield: 65, annual: true)

    visit "/crops/#{crop1.id}"

    expect(page).to have_content(crop1.name)
    expect(page).to have_content(crop1.yield)
    expect(page).to have_content(crop1.annual)
    expect(page).to have_content(crop1.farm_id)
    expect(page).to have_content(crop1.updated_at)
    expect(page).to have_content(crop1.created_at)
    expect(page).to have_content(crop1.id)

    expect(page).to_not have_content(crop2.name)
  end

end
