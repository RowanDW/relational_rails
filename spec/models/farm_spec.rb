require 'rails_helper'

RSpec.describe Farm do
  it {should have_many :crops}

end
