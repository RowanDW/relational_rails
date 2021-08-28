# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info
require 'rails_helper'

RSpec.describe 'edit farm page' do
  before :each do
    @farm = Farm.create!(name: "Shrut Farms", acres: 40, organic: true)
  end

  it 'links from farm show to farm edit page' do
    visit "/farms/#{@farm.id}"

    click_button "Edit #{@farm.name}"
    expect(current_path).to eq("/farms/#{@farm.id}/edit")
  end

  it 'can edit the farm' do
    visit "/farms/#{@farm.id}"
    expect(page).to have_content("Shrut Farms")

    click_button "Edit Shrut Farms"

    fill_in 'Name', with: "Schrute Farms"
    fill_in 'Acres', with: 80
    check 'organic'
    click_button 'Update Farm'

    expect(current_path).to eq("/farms/#{@farm.id}")
    expect(page).to have_content("Schrute Farms")
  end
end
