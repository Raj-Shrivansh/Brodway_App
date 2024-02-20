class Play < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :reviews
    has_one_attached :main_image
    validates :title,presence: true, length: {minimum: 5,maximum: 40}
    validates :desc,presence: true, length: {minimum: 50}
    validates :director,presence: true
end
