class TalkRating < ApplicationRecord
  belongs_to :talk
  belongs_to :rating

  validates :talk_id, :rating_id, :count, presence: true
end
