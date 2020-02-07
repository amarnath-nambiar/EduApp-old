class Course < ApplicationRecord
  default_scope { where(:deleted_at => nil) }

  belongs_to :college
  has_many :course_interests, dependent: :destroy
  has_many :interests, through: :course_interests
  has_many :media, as: :imageable

  validates :full_name, presence: true, uniqueness: { scope: :college_id, case_sensitive: false }
end
