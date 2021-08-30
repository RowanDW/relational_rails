require 'rails_helper'

RSpec.describe 'destroying a farm' do
  before :each do
    @farm1 = Farm.create!(name: "Schrute Farms", acres: 40, organic: true)
    @farm2 = Farm.create!(name: "Old MacDonald's", acres: 100, organic: false)
    @farm3 = Farm.create!(name: "Farmy Farm", acres: 120, organic: true)
    @crop1 = @farm1.crops.create!(name: 'Tomatoes', yield: 30, annual: true)
    @crop2 = @farm2.crops.create!(name: 'Beans', yield: 65, annual: true)
    @crop3 = @farm1.crops.create!(name: 'Peaches', yield: 25, annual: false)
  end

  it "can delete the farm from the index page" do
    visit "/farms/#{@farm1.id}"

    click_button("Delete Schrute Farms")

    expect(current_path).to eq('/farms')
    expect(page).to_not have_content("Schrute Farms")
  end

  it "deletes all children when deleting a parent" do
    visit "/farms/#{@farm1.id}"

    click_button("Delete Schrute Farms")
    visit '/crops'

    expect(page).to_not have_content("Tomatoes")
    expect(page).to_not have_content("Peaches")
  end
end
