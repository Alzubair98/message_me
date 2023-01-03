class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :username, presence: true, length: { maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 105 },
    uniqueness: { case_sensitivve: false},
    format: { with: VALID_EMAIL_REGEX }
    validates :password_digest, presence: true
    has_secure_password
end
