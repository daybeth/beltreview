class Event < ActiveRecord::Base
  belongs_to :user
  has_many :joins ,dependent: :destroy
  has_many :users, through: :joins , dependent: :destroy
  has_many :comments,dependent: :destroy
  validates :name, :date, :location, :state, presence: true
end
