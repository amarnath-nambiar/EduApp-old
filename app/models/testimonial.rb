class Testimonial < ApplicationRecord
  belongs_to :college

  validates :author_name, :about_author, :description, presence: true

end
