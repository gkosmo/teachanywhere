class Event < ApplicationRecord
  has_many :attendances
  belongs_to :course
  belongs_to :user
end
