class Review < ApplicationRecord
    belongs_to :plays
    belongs_to :user
end
