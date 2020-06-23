class Group < ApplicationRecord
    belongs_to :user
    has_many :transactions

    validates :name, presence: true, length: { maximum: 20 }
    validates :icon, presence: true
end