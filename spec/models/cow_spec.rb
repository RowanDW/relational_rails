require 'rails_helper'

RSpec.describe Cow do
  it {should belong_to :ranch}
end
