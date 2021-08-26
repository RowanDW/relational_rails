require 'rails_helper'

RSpec.describe 'the farm index page' do

  before :each do
    @farm = Farm.create!(name: "Schrute Farms", acres: 40, organic: true)
    @farm2 = Farm.create!(name: "Old MacDonald's", acres: 100, organic: false)
  end

  it 'displays the name of each farm' do
    visit '/farms'

    expect(page).to have_content(@farm.name)
    expect(page).to have_content(@farm2.name)
  end

  it 'is ordered by most recently created' do
    visit '/farms'

    expect("Old MacDonald's").to appear_before("Schrute Farms")
  end

  it 'shows the creation time next to each record' do
    visit '/farms'

    expect(page).to have_content(@farm.created_at)
    expect(page).to have_content(@farm2.created_at)
  end
end
