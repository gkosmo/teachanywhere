class Course < ApplicationRecord
  has_many :events, dependent: :destroy
  belongs_to :user
  has_many :subscriptions
  acts_as_votable
  def votes
    self.votes_for.size
  end
end
