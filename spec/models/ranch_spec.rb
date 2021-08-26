require 'rails_helper'

RSpec.describe Ranch do
  it {should have_many :cows}
end
