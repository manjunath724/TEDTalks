class Talk < ApplicationRecord
  belongs_to :event
  belongs_to :speaker

  has_many :talk_ratings
  has_many :ratings, through: :talk_ratings

  has_many :tag_talks
  has_many :tags, through: :tag_talks

  has_many :related_talks

  validates :event_id, :speaker_id, :description, :name, :published_date, :title, :url, :views, presence: true

  searchable do
    text :name, :title
    text :speaker_occupation do
      speaker.occupation
    end
    text :event do
      event.name
    end

    integer :views
    integer :event_id
    integer :tag_ids, multiple: true
    time :published_date
  end
end
