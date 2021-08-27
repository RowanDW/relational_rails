class Farm < ApplicationRecord
  has_many :crops

  def crops_count
    crops.count
  end

  def self.order_desc_created_at
    order(created_at: :desc)
  end
end
