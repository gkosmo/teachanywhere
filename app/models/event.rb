class Event < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :location_changed?
  has_many :attendances
  belongs_to :course
  belongs_to :user
end
