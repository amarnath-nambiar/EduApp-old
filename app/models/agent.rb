class Agent < ApplicationRecord
  has_secure_password

  has_many :colleges

  validates :first_name, :phone, presence: true
  # validates :email, presence: true
  # validates :email, uniqueness: { case_sensitive: false }
  validates :phone, numericality: true, uniqueness: true, length: { is: 10 }

end
