class User < ApplicationRecord
    before_save { self.email = email.downcase }

    has_many :messages , dependent: :destroy

    validates :username, presence: true, length: { maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 105 },
    uniqueness: { case_sensitivve: false},
    format: { with: VALID_EMAIL_REGEX }
    validates :password_digest, presence: true
    has_secure_password

    # to not show our name as logged in users 
    scope :all_except, ->(user){ where.not(id: user)}
end
