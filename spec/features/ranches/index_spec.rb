require 'rails_helper'

# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created

RSpec.describe 'Ranches index' do
  before(:each) do
    @ranch_1 = Ranch.create!(name: "Fernando's Fine Bovines", max_capacity: 50, certified_humane: true)
    @ranch_2 = Ranch.create!(name: "Janie's Jolly Cow Corral", max_capacity: 80, certified_humane: false)
  end

  it 'displays the name of each ranch' do
    visit "/ranches"

    expect(page).to have_content("Fernando's Fine Bovines")
    expect(page).to have_content("Janie's Jolly Cow Corral")
  end

  it 'orders by most recently created' do
    visit "/ranches"

    expect("Janie's Jolly Cow Corral").to appear_before("Fernando's Fine Bovines")
  end

  it 'displays created_at next to each record' do
    visit "/ranches"
    
    expect(page).to have_content(@ranch_1.created_at)
    expect(page).to have_content(@ranch_2.created_at)
  end
end
