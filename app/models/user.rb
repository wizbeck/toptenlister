class User < ApplicationRecord
has_secure_password
has_many :lists
has_many :topics, through: :lists

#validations need to be added
validates :username, uniqueness: true
validates :username, length: {minimum: 5}



end
