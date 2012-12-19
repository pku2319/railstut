class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation,
    :remember_token
  has_secure_password
  has_many :microposts, dependent: :destroy
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

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


  def feed
    Micropost.where("user_id = ?", id) 
  end  

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end