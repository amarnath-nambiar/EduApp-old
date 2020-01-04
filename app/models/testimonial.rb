class Testimonial < ApplicationRecord
  belongs_to :college

  validate :author_name, :about_author, :description, presence: true

end
