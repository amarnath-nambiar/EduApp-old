class Interest < ApplicationRecord
  default_scope { where(:deleted_at => nil) }

  has_many :course_interests, dependent: :destroy
  has_many :student_interests, dependent: :destroy

  validates :title, presence: true, uniqueness: { case_sensitive: false}
end
