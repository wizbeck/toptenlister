# frozen_string_literal: true

# Schema Information
# "username"        :string
# "password_digest" :string
# "created_at"      :datetime, precision: 6, null: false
# "updated_at"      :datetime, precision: 6, null: false

class User < ApplicationRecord
  # BCrypt methods
  has_secure_password

  # Relationships
  has_many :lists
  has_many :topics, through: :lists

  # Validations
  validates :username, uniqueness: true
  validates :username, length: { minimum: 6 }

  # validates :password, presence: true, length: { minimum: 5 }
  # - look up docs for how devise overrides has_secure_password
  # validations compared to manually setting validations in model
end
