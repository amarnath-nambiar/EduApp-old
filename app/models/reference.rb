class Reference < ApplicationRecord
  default_scope { where(:deleted_at => nil) }

  belongs_to :student

  validates :full_name, :phone, presence: true
  validates :phone, numericality: true, uniqueness: { scope: :student_id}, length: { is: 10 }
end
