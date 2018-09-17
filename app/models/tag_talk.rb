class TagTalk < ApplicationRecord
  belongs_to :tag
  belongs_to :talk

  validates :tag_id, :talk_id, presence: true
end
