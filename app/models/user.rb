class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password
  before_save { |user| user.email = email.downcase }
  has_many :microposts

  #EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validates :name, 
  	presence: true,
  	length: {maximum: 50}  
  validates :email,
    presence: true, 
  	uniqueness: { case_sensitive: false }, 
  	length: {minimum: 7},
  	format: {with: EMAIL_REGEX, on: :create},
  	confirmation: true
	validates :password, 
		length: { minimum: 6 }
	validates :password_confirmation, 
		presence: true

end