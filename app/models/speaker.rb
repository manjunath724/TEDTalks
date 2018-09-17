class Speaker < ApplicationRecord
  has_many :talks

  validates :name, :occupation, presence: true
end
