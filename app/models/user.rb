class User < ApplicationRecord
  has_secure_password
  #has_many :todos
  has_one :cart

  validates :name, presence: true
  validates :email, presence: true
  #validates :password, presence: true
end
