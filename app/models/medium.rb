class Medium < ApplicationRecord
  belongs_to :imageable, polymorphic: true
end
