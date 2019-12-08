class College < ApplicationRecord
  belongs_to :agent
  has_many :courses, dependent: :destroy
  has_many :media, as: :imageable
  has_many :testimonials
end
