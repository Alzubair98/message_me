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
    # to add the users to the list after the user is created without the need of refresh the page
    after_create_commit { broadcast_append_to "users" }
end
