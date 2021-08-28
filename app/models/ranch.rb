class Ranch < ApplicationRecord
  has_many :cows

  def cows_count
    cows.count
  end

  def self.order_created_at_desc
    binding.pry
    order(created_at: :desc)
  end
end
