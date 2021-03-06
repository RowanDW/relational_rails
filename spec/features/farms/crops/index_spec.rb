require 'rails_helper'

RSpec.describe 'displays name of each crop in database' do
  before(:each) do
    @farm = Farm.create!(name: "Schrute Farms", acres: 40, organic: true)
    @farm2 = Farm.create!(name: "Old MacDonald's", acres: 80, organic: false)
    @crop1 = @farm.crops.create!(name: 'Tomatoes', yield: 30, annual: true)
    @crop2 = @farm2.crops.create!(name: 'Beans', yield: 65, annual: true)
    @crop3 = @farm.crops.create!(name: 'Peaches', yield: 25, annual: false)
  end

  it 'links to all child indexes' do
    visit "/farms/#{@farm.id}/crops"

    expect(page).to have_content("Crops Index")
    expect(page).to have_content("Cows Index")

    click_on "Crops Index"
    expect(current_path).to eq("/crops")

    visit "/farms/#{@farm.id}/crops"

    click_on "Cows Index"
    expect(current_path).to eq("/cows")
  end

  it 'links to all parent indexes' do
    visit "/farms/#{@farm.id}/crops"

    expect(page).to have_content("Farms Index")
    expect(page).to have_content("Ranches Index")

    click_on "Farms Index"
    expect(current_path).to eq("/farms")

    visit "/farms/#{@farm.id}/crops"

    click_on "Ranches Index"
    expect(current_path).to eq("/ranches")
  end

  it 'displays the attributes of each crop of the farm' do
    visit "/farms/#{@farm.id}/crops"

    expect(page).to have_content(@crop1.name)
    expect(page).to have_content(@crop3.name)

    expect(page).to have_content(@crop1.yield)
    expect(page).to have_content(@crop3.yield)

    expect(page).to have_content(@crop1.annual)
    expect(page).to have_content(@crop3.annual)

    expect(page).to have_content(@crop1.farm_id)
    expect(page).to have_content(@crop3.farm_id)

    expect(page).to have_content(@crop1.updated_at)
    expect(page).to have_content(@crop3.updated_at)

    expect(page).to have_content(@crop1.created_at)
    expect(page).to have_content(@crop3.created_at)

    expect(page).to have_content(@crop1.id)
    expect(page).to have_content(@crop3.id)

    expect(page).to_not have_content(@crop2.name)
  end

  it 'can link each crop to its edit page' do
    visit "/farms/#{@farm.id}/crops"

    expect(page).to have_button("Edit Tomatoes")
    expect(page).to have_button("Edit Peaches")

    click_on "Edit Tomatoes"
    expect(current_path).to eq("/crops/#{@crop1.id}/edit")

    visit "/farms/#{@farm.id}/crops"

    click_on "Edit Peaches"
    expect(current_path).to eq("/crops/#{@crop3.id}/edit")
  end

  it 'can click a link that alphabatizes the crops' do
    visit "/farms/#{@farm.id}/crops"

    expect("Tomatoes").to appear_before("Peaches")

    expect(page).to have_button("Alphabetical")
    click_on "Alphabetical"

    expect(current_path).to eq("/farms/#{@farm.id}/crops")
    expect("Peaches").to appear_before("Tomatoes")
  end

  it "can submit a form that filters results" do
    crop4 = @farm.crops.create!(name: 'Cabbage', yield: 12, annual: true)

    visit "/farms/#{@farm.id}/crops"

    expect(page).to have_content("Tomatoes")
    expect(page).to have_content("Peaches")
    expect(page).to have_content("Cabbage")

    fill_in('yield_threshold', with: 20)
    click_button("Only show crops with more than above bushels of yield")

    expect(current_path).to eq("/farms/#{@farm.id}/crops")
    expect(page).to have_content("Tomatoes")
    expect(page).to have_content("Peaches")
    expect(page).to_not have_content("Cabbage")
  end

  it "can link each crop to its show page" do
    visit "/farms/#{@farm.id}/crops"

    expect(page).to have_link("Tomatoes")
    expect(page).to have_link("Peaches")

    click_link "Tomatoes"

    expect(current_path).to eq("/crops/#{@crop1.id}")
  end
end
