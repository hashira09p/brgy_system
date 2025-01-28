class User < ApplicationRecord
  has_many :users
  enum gender: { male: 0, female: 1, other: 2 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end