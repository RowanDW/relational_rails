require 'rails_helper'

RSpec.describe 'the farm index page' do

  it 'displays the name of each farm' do
    farm = Farm.create!(name: "Shrute Farms", acres: 40, organic: true)
    farm2 = Farm.create!(name: "Old MacDonald's", acres: 100, organic: false)

    visit '/farms'

    expect(page).to have_content(farm.name)
    expect(page).to have_content(farm2.name)
  end
end
