require 'rails_helper'

RSpec.describe 'the crops index page' do
  before(:each) do
    @farm = Farm.create!(name: "Schrute Farms", acres: 40, organic: true)
    @crop1 = @farm.crops.create!(name: 'Tomatoes', yield: 30, annual: true)
    @crop2 = @farm.crops.create!(name: 'Beans', yield: 65, annual: true)
    @crop3 = @farm.crops.create!(name: 'Apples', yield: 22, annual: false)
  end

  it 'links to all child indexes' do
    visit "/crops"

    expect(page).to have_content("Crops Index")
    expect(page).to have_content("Cows Index")

    click_on "Crops Index"
    expect(current_path).to eq("/crops")

    visit "/crops"

    click_on "Cows Index"
    expect(current_path).to eq("/cows")
  end

  it 'links to all parent indexes' do
    visit "/crops"

    expect(page).to have_content("Farms Index")
    expect(page).to have_content("Ranches Index")

    click_on "Farms Index"
    expect(current_path).to eq("/farms")

    visit "/crops"

    click_on "Ranches Index"
    expect(current_path).to eq("/ranches")
  end

  it 'displays the attributes of each crop' do
    visit '/crops'

    expect(page).to have_content(@crop1.name)
    expect(page).to have_content(@crop2.name)

    expect(page).to have_content(@crop1.yield)
    expect(page).to have_content(@crop2.yield)

    expect(page).to have_content(@crop1.annual)
    expect(page).to have_content(@crop2.annual)

    expect(page).to have_content(@crop1.farm_id)
    expect(page).to have_content(@crop2.farm_id)

    expect(page).to have_content(@crop1.updated_at)
    expect(page).to have_content(@crop2.updated_at)

    expect(page).to have_content(@crop1.created_at)
    expect(page).to have_content(@crop2.created_at)

    expect(page).to have_content(@crop1.id)
    expect(page).to have_content(@crop2.id)
  end

  it 'links to all child indexes' do
    visit '/crops'

    expect(page).to have_content("Crops Index")
    expect(page).to have_content("Cows Index")

    click_on "Crops Index"
    expect(current_path).to eq("/crops")

    visit '/crops'

    click_on "Cows Index"
    expect(current_path).to eq("/cows")
  end

  it 'links to all parent indexes' do
    visit '/crops'

    expect(page).to have_content("Farms Index")
    expect(page).to have_content("Ranches Index")

    click_on "Farms Index"
    expect(current_path).to eq("/farms")

    visit '/crops'

    click_on "Ranches Index"
    expect(current_path).to eq("/ranches")
  end

  it 'only shows crops that where annual is true' do
    visit '/crops'

    expect(page).to have_content("Tomatoes")
    expect(page).to have_content("Beans")
    expect(page).to_not have_content("Apples")
  end

  it 'can link each crop to its edit page' do
    visit '/crops'

    expect(page).to have_button("Edit Tomatoes")
    expect(page).to have_button("Edit Beans")

    click_on "Edit Tomatoes"
    expect(current_path).to eq("/crops/#{@crop1.id}/edit")

    visit '/crops'

    click_on "Edit Beans"
    expect(current_path).to eq("/crops/#{@crop2.id}/edit")
  end

  it "can display a delete button next to each crop" do
    visit '/crops'

    expect(page).to have_button("Delete Tomatoes")
    expect(page).to have_button("Delete Beans")

    click_on "Delete Tomatoes"
    expect(current_path).to eq("/crops")

    expect(page).to_not have_content("Tomatoes")
  end

end
