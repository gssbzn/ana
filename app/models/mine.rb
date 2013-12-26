class Mine < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :latitude, :longitude, presence: true, numericality: true
end
