class College < ApplicationRecord
  belongs_to :agent
  has_many :courses, dependent: :destroy
  has_many :media, as: :imageable
  has_many :testimonials

  validate :full_name, :address, :city, :country, presence: true
  validate :code, uniqueness: { case_sensitive: false }



end
