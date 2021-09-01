class Cow < ApplicationRecord
  belongs_to :ranch

  def self.all_grass_fed
    Cow.where(grass_fed: true)
  end

  def self.sort_by_name
    Cow.order(Arel.sql('LOWER(name)'))
  end

  def self.older_than(age_threshold)
    Cow.where("age > #{age_threshold}")
  end

  def self.exact_name(name)
    Cow.where(name: name)
  end
end
