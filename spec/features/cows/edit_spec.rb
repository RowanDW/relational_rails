# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information

require 'rails_helper'

RSpec.describe 'Cow editing' do
  before(:each) do
    @ranch_1 = Ranch.create!(name: "Fernando's Fine Bovines", max_capacity: 50, certified_humane: true)
    @cow_1 = @ranch_1.cows.create!(name: "Bessie Lou", age: 2, grass_fed: true)
    @cow_2 = @ranch_1.cows.create!(name: "Bobbie Jean", age: 4, grass_fed: true)
  end

  it 'links to the edit page' do
    visit "/cows/#{@cow_1.id}"

    click_button("Edit Bessie Lou")

    expect(current_path).to eq("/cows/#{@cow_1.id}/edit")
  end

  it 'can edit the cow' do
    visit "/cows/#{@cow_2.id}"

    expect(page).to have_content("Bobbie Jean")

    click_button("Edit Bobbie Jean")

    fill_in("name", with: "Bonnie Jean")
    fill_in("age",  with: 2)
    check("grass_fed")

    click_button("Update Cow")

    expect(current_path).to eq("/cows/#{@cow_2.id}")
    expect(page).to have_content("Bonnie Jean")
  end
end
