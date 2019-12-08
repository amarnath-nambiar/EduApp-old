class Rating < ApplicationRecord
  belongs_to :college
  belongs_to :student
end
