class Medium < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  validate :url, :media_type, presence: true
end
