class Course < ApplicationRecord
  belongs_to :college
  has_many :course_interests, dependent: :destroy
  has_many :interests, through: :course_interests
  has_many :media, as: :imageable
end
