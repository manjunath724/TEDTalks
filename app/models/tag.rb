class Tag < ApplicationRecord
  has_many :tag_talks
  has_many :talks, through: :tag_talks

  validates :name, presence: true
end
