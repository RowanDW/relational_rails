class Farm < ApplicationRecord
  has_many :crops

  def crops_count
    crops.count
  end

  def self.order_created_at_desc
    order(created_at: :desc)
  end
end
