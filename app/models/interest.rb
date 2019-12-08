class Interest < ApplicationRecord
  has_many :course_interests, dependent: :destroy
  has_many :student_interests, dependent: :destroy
end
