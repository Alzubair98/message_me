class Room < ApplicationRecord
    validates :name, presence: true,
                uniqueness: { case_sensitivve: false}
    scope :public_rooms, -> { where(is_private: false) }

end
