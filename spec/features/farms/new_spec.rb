require 'rails_helper'

# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

RSpec.describe 'can create a new farm' do
  before :each do
    @farm = Farm.create!(name: "Schrute Farms", acres: 40, organic: true)
  end

  it 'links to all child indexes' do
    visit '/farms/new'

    expect(page).to have_content("Crops Index")
    expect(page).to have_content("Cows Index")

    click_on "Crops Index"
    expect(current_path).to eq("/crops")

    visit '/farms/new'

    click_on "Cows Index"
    expect(current_path).to eq("/cows")
  end

  it 'links to all parent indexes' do
    visit '/farms/new'

    expect(page).to have_content("Farms Index")
    expect(page).to have_content("Ranches Index")

    click_on "Farms Index"
    expect(current_path).to eq("/farms")

    visit '/farms/new'

    click_on "Ranches Index"
    expect(current_path).to eq("/ranches")
  end

  it 'can link from the farm index to new artist page' do
    visit '/farms'

    expect(page).to have_content('New Farm')
    click_on "New Farm"
    expect(current_path).to eq("/farms/new")
  end

  it 'can create a new farm' do
    visit '/farms/new'

    fill_in('Name', with: "Old MacDonald's")
    fill_in('Acres', with: 80)
    check 'organic'

    click_button('Create Farm')

    expect(current_path).to eq("/farms")
    expect(page).to have_content("Old MacDonald's")
  end
end
