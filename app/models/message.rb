class Message < ApplicationRecord
    belongs_to :user
    validate :body, presence: true
end
