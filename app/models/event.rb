class Event < ApplicationRecord
  has_many :talks

  validates :name, presence: true
end
