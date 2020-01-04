class Medium < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  validates :url, :media_type, presence: true
end
