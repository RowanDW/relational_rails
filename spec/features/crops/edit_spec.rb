require 'rails_helper'

RSpec.describe 'edit farm crop page' do
  before :each do
    @farm = Farm.create!(name: "Shrut Farms", acres: 40, organic: true)
    @crop = @farm.crops.create!(name: "Green Ben", yield: 40, annual: true)
  end

  it 'links to all child indexes' do
    visit "/crops/#{@crop.id}/edit"

    expect(page).to have_content("Crops Index")
    expect(page).to have_content("Cows Index")

    click_on "Crops Index"
    expect(current_path).to eq("/crops")

    visit "/crops/#{@crop.id}/edit"

    click_on "Cows Index"
    expect(current_path).to eq("/cows")
  end

  it 'links to all parent indexes' do
    visit "/crops/#{@crop.id}/edit"

    expect(page).to have_content("Farms Index")
    expect(page).to have_content("Ranches Index")

    click_on "Farms Index"
    expect(current_path).to eq("/farms")

    visit "/crops/#{@crop.id}/edit"

    click_on "Ranches Index"
    expect(current_path).to eq("/ranches")
  end

  it 'links from crop show to crop edit page' do
    visit "/crops/#{@crop.id}"

    click_button "Update #{@crop.name}"
    expect(current_path).to eq("/crops/#{@crop.id}/edit")
  end

  it 'can edit the crop' do
    visit "/crops/#{@crop.id}"
    expect(page).to have_content("Green Ben")

    click_button "Update Green Ben"

    fill_in 'Name', with: "Green Bean"
    fill_in 'yield', with: 40
    check 'annual'
    click_button 'Update Crop'

    expect(current_path).to eq("/crops/#{@crop.id}")
    expect(page).to have_content("Green Bean")
  end
end
