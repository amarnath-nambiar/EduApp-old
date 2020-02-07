class College < ApplicationRecord
  default_scope { where(:deleted_at => nil) }

  belongs_to :agent
  has_many :courses, dependent: :destroy
  has_many :media, as: :imageable
  has_many :testimonials

  validates :full_name, :address, :city, :country, presence: true
  validates :code, uniqueness: { allow_blank: true, case_sensitive: false }
  validates :full_name, uniqueness: { case_sensitive: false, scope: :city }


end
