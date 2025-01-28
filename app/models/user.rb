class User < ApplicationRecord
  enum gender: { male: 0, female: 1, other: 2 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end