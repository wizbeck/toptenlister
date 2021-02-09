class User < ApplicationRecord
has_secure_password
has_many :lists
has_many :topics, through: :lists

validates :username, uniqueness: true
validates :username, length: {minimum: 6}

# validates :password, presence: true, length: { minimum: 5 } - look up docs for how devise overrides has_secure_password validations compared to manually setting validations in model


end
