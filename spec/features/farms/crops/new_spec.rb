# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed
require 'rails_helper'

RSpec.describe 'Create a new farm crop' do

  before :each do
    @farm = Farm.create!(name: "Schrute Farms", acres: 40, organic: true)
  end

  it 'links from farm crop index page to new' do
    visit "/farms/#{@farm.id}/crops"

    expect(page).to have_content('New Schrute Farms Crop')
    click_on 'New Schrute Farms Crop'
    expect(current_path).to eq("/farms/#{@farm.id}/crops/new")
  end

  it 'can create a new farm crop' do
    visit "/farms/#{@farm.id}/crops/new"

    fill_in('Name', with: "Tomato")
    fill_in('Yield', with: 25)
    check 'annual'

    click_button('Create Schrute Farms Crop')

    expect(current_path).to eq("/farms/#{@farm.id}/crops")
    expect(page).to have_content("Tomato")
  end
end
