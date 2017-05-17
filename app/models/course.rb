class Course < ApplicationRecord
  has_many :events, dependent: :destroy
  belongs_to :user
  has_many :subscriptions
  
end
