class Lead < ApplicationRecord
  default_scope { where(:deleted_at => nil) }

  belongs_to :student
  belongs_to :course
end
