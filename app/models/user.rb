class User < ActiveRecord::Base
  has_secure_password
 	has_many :joins , dependent: :destroy
 	has_many :comments , dependent: :destroy
 	has_many :events , dependent: :destroy
 	has_many :events_joined, through: :joins , source: :events, dependent: :destroy
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :location, :state, presence: true
  validates :first_name, :last_name, :location, presence: true, length: { in: 2..20 } ,:on => :create
  validates :password, length: {minimum: 8}
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX } , :on => :create
  validates :first_name,:last_name, :location, length: { in: 2..20 } ,:on => :update
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX } , :on => :update
end
