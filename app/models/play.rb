class Play < ApplicationRecord
    belongs_to :user
    belongs_to :category
    validates :title,presence: true, length: {minimum: 5,maximum: 40}
    validates :desc,presence: true, length: {minimum: 50}
    validates :director,presence: true
end
