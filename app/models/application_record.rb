class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  def self.deleted
    self.unscoped.where('deleted_at IS NOT NULL')
  end
end
