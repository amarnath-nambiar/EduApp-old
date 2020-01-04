class Rating < ApplicationRecord
  belongs_to :college
  belongs_to :student

  validates :title, presence: true, length: { in: 6..100 }

end
