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

  it 'links to all child indexes' do
    visit "/cows/#{@cow_1.id}/edit"

    expect(page).to have_content("Crops Index")
    expect(page).to have_content("Cows Index")

    click_on "Crops Index"
    expect(current_path).to eq("/crops")

    visit "/cows/#{@cow_1.id}/edit"

    click_on "Cows Index"
    expect(current_path).to eq("/cows")
  end

  it 'links to all parent indexes' do
    visit "/cows/#{@cow_1.id}/edit"

    expect(page).to have_content("Farms Index")
    expect(page).to have_content("Ranches Index")

    click_on "Farms Index"
    expect(current_path).to eq("/farms")

    visit "/cows/#{@cow_1.id}/edit"

    click_on "Ranches Index"
    expect(current_path).to eq("/ranches")
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

#   As a visitor
# When I visit the `child_table_name` index page or a parent `child_table_name` index page
# Next to every child, I see a link to edit that child's info
# When I click the link
# I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 11
  it 'is linked from the cow index page' do
    visit "/cows"

    click_button("Edit Bessie Lou")
    expect(current_path).to eq("/cows/#{@cow_1.id}/edit")

    visit "/cows"
    click_button("Edit Bobbie Jean")
    expect(current_path).to eq("/cows/#{@cow_2.id}/edit")
  end

  it 'is linked from the ranch cow index page' do
    visit "/ranches/#{@ranch_1.id}/cows"

    click_button("Edit Bessie Lou")
    expect(current_path).to eq("/cows/#{@cow_1.id}/edit")

    visit "/ranches/#{@ranch_1.id}/cows"
    click_button("Edit Bobbie Jean")
    expect(current_path).to eq("/cows/#{@cow_2.id}/edit")
  end
end
