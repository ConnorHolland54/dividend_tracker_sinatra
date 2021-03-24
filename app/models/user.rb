class User < ActiveRecord::Base
  has_many :stocks
  validates :email, uniqueness: true
  has_secure_password
end
