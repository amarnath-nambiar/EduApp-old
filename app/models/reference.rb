class Reference < ApplicationRecord
  belongs_to :student

  validates :full_name, :phone, presence: true
  validates :phone, numericality: true, uniqueness: true, length: { is: 10 }
end
