class Location < ApplicationRecord
  validates :city, :country, presence: true

  has_many :weathers

  def print
    "#{city},#{country}"
  end

  def self.random
    # for really good preformance you can keep the ids stored in memory
    random_id = Location.pluck(:id).sample
    Location.find(random_id)
  end
end
