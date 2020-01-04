class Student < ApplicationRecord
  has_many :leads
  has_many :references
  has_many :messages
  has_many :ratings

  validates :first_name, :phone, presence: true
  # validates :email, presence: true
  # validates :email, uniqueness: { case_sensitive: false }
  validates :phone, numericality: true, uniqueness: true, length: { is: 10 }


end
