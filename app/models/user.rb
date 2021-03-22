class User < ActiveRecord::Base
  has_many :stocks
  has_secure_password
end
