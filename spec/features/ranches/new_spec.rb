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

require 'rails_helper'

RSpec.describe 'new Ranch creation' do
  it 'displays a link to make a new ranch' do
    visit "/ranches"

    click_link('New Ranch')
    expect(current_path).to eq('/ranches/new')
  end

  it 'can create a new ranch' do
    visit "/ranches/new"

    fill_in("name",         with: "Fernando's Fine Bovines")
    fill_in("max_capacity", with: 50)
    check("certified_humane")

    click_button('Create Ranch')

    ranch_id = Ranch.last.id

    expect(current_path).to eq("/ranches")
    expect(page).to have_content("Fernando's Fine Bovines")
  end
end
