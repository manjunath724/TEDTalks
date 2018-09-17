class Rating < ApplicationRecord
  has_many :talk_ratings
  has_many :talks, through: :talk_ratings

  validates :name, presence: true
end
