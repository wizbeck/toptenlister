class User < ApplicationRecord
has_secure_password
has_many :lists
has_many :topics, through: :lists
#validations need to be added
end
