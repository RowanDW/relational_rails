class Ranch < ApplicationRecord
  has_many :cows

  def cows_count
    cows.count
  end

  def self.order_desc_created_at
    order(created_at: :desc)
  end
end
