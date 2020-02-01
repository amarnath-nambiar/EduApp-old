class Medium < ApplicationRecord
  default_scope { where(:deleted_at => nil) }

  belongs_to :imageable, polymorphic: true

  validates :url, :media_type, presence: true
end
