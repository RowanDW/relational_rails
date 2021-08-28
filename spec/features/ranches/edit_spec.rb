# As a visitor
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

RSpec.describe 'Ranch editing' do
  before(:each) do
    @ranch_1 = Ranch.create!(name: "Fernando's Fine Bovines", max_capacity: 50, certified_humane: true)
  end

  it 'links to the edit page' do
    visit "/ranches/#{@ranch_1.id}"

    click_button("Edit Fernando's Fine Bovines")

    expect(current_path).to eq("/ranches/#{@ranch_1.id}/edit")
  end

  it 'can edit the ranch' do
    visit "/ranches/#{@ranch_1.id}"

    expect(page).to have_content("Fernando's Fine Bovines")

    click_button("Edit Fernando's Fine Bovines")

    fill_in("name",         with: "Fernando's Fabulous Bovines")
    fill_in("max_capacity", with: 50)
    check("certified_humane")

    click_button("Update Ranch")

    expect(current_path).to eq("/ranches/#{@ranch_1.id}")
    expect(page).to have_content("Fernando's Fabulous Bovines")
  end
end
