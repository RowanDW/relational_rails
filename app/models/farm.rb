class Farm < ApplicationRecord
  has_many :crops

  def crops_count
    crops.count
  end
end
