class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :attendances
  has_many :courses
  has_many :reviews
  has_many :subscriptions
  mount_uploader :photo, PhotoUploader
  acts_as_voter
end
