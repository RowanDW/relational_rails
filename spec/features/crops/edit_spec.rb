# As a visitor When I visit a Child Show page Then I see a link to update
# that Child "Update Child" When I click the link I am taken to
# '/child_table_name/:id/edit' where I see a form to edit the child's
# attributes: When I click the button to submit the form "Update Child"
# Then a PATCH request is sent to '/child_table_name/:id', the child's data
# is updated, and I am redirected to the Child Show page where I see the
# Child's updated information

require 'rails_helper'

RSpec.describe 'edit farm crop page' do
  before :each do
    @farm = Farm.create!(name: "Shrut Farms", acres: 40, organic: true)
    @crop = @farm.crops.create!(name: "Green Ben", yield: 40, annual: true)
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
