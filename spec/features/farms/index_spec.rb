require 'rails_helper'

RSpec.describe 'the farm index page' do

  before :each do
    @farm1 = Farm.create!(name: "Schrute Farms", acres: 40, organic: true)
    @farm2 = Farm.create!(name: "Old MacDonald's", acres: 100, organic: false)
  end

  it 'links to all child indexes' do
    visit '/farms'

    expect(page).to have_content("Crops Index")
    expect(page).to have_content("Cows Index")

    click_on "Crops Index"
    expect(current_path).to eq("/crops")

    visit '/farms'

    click_on "Cows Index"
    expect(current_path).to eq("/cows")
  end

  it 'links to all parent indexes' do
    visit '/farms'

    expect(page).to have_content("Farms Index")
    expect(page).to have_content("Ranches Index")

    click_on "Farms Index"
    expect(current_path).to eq("/farms")

    visit '/farms'

    click_on "Ranches Index"
    expect(current_path).to eq("/ranches")
  end

  it 'displays the name of each farm' do
    visit '/farms'

    expect(page).to have_content(@farm1.name)
    expect(page).to have_content(@farm2.name)
  end

  it 'is ordered by most recently created' do
    visit '/farms'

    expect("Old MacDonald's").to appear_before("Schrute Farms")
  end

  it 'shows the creation time next to each record' do
    visit '/farms'

    expect(page).to have_content(@farm1.created_at)
    expect(page).to have_content(@farm2.created_at)
  end

  it 'can link each parent to its edit page' do
    visit '/farms'

    expect(page).to have_button("Edit Schrute Farms")
    expect(page).to have_button("Edit Old MacDonald's")

    click_on "Edit Schrute Farms"
    expect(current_path).to eq("/farms/#{@farm1.id}/edit")

    visit '/farms'

    click_on "Edit Old MacDonald's"
    expect(current_path).to eq("/farms/#{@farm2.id}/edit")
  end

  it "can display a delete button next to each farm" do
    visit '/farms'

    expect(page).to have_button("Delete Schrute Farms")
    expect(page).to have_button("Delete Old MacDonald's")

    click_on "Delete Schrute Farms"

    expect(current_path).to eq('/farms')
    expect(page).to_not have_content("Schrute Farms")
  end

  it "can link each crop to its show page" do
    visit "/farms"

    expect(page).to have_link("Schrute Farms")
    expect(page).to have_link( "Old MacDonald's")

    click_link "Schrute Farms"

    expect(current_path).to eq("/farms/#{@farm1.id}")
  end

  it "can click a button to sort farms by crop count" do
    farm3 = Farm.create!(name: "Farmy Farm", acres: 100, organic: false)
    crop1 = @farm1.crops.create!(name: 'Tomatoes', yield: 30, annual: true)
    crop2 = @farm2.crops.create!(name: 'Beans', yield: 65, annual: true)
    crop3 = @farm2.crops.create!(name: 'Apples', yield: 22, annual: false)

    visit '/farms'

    expect("Farmy Farm").to appear_before("Old MacDonald's")
    expect("Old MacDonald's").to appear_before("Schrute Farms")
    expect(page).to have_button("Sort by crop count")

    click_button "Sort by crop count"

    expect(current_path).to eq('/farms')

    expect("Old MacDonald's").to appear_before("Schrute Farms")
    expect("Schrute Farms").to appear_before("Farmy Farm")

    expect(page).to have_content("Schrute Farms - Crop Count: 1")
    expect(page).to have_content("Old MacDonald's - Crop Count: 2")
    expect(page).to have_content("Farmy Farm - Crop Count: 0")

  end
end
