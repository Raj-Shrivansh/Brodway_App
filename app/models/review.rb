class Review < ApplicationRecord
    belongs_to :play
    belongs_to :user
    validates :comment, presence: true, length: {minimum:50}
    validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
