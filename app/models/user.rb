class User < ActiveRecord::Base
  has_secure_password
  validates :password, presence: true, allow_blank: true, length: { minimum: 5}
  validates :username, presence: true, uniqueness: true
  has_one :driver
  has_one :rider

  #TODO how to create a user and driver relation?
  #when user logs in they determine if they are driver or rider
  #fill out form for one (driver)
  #driver id is added to user
end
