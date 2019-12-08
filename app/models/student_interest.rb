class StudentInterest < ApplicationRecord
  belongs_to :student
  belongs_to :interest
end
