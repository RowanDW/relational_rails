class Cow < ApplicationRecord
  belongs_to :ranch

  def self.all_grass_fed
    Cow.where(grass_fed: true)
  end

  def self.sort_by_name
    Cow.order(:name)

    # Cow.order('lower(name)')

    # Cow.all.sort_by do |cow|
    #   cow.name.downcase
    # end
  end

  def self.older_than(age_threshold)
    Cow.where("age > #{age_threshold}")
  end
end
