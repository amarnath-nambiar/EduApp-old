class Student < ApplicationRecord
  has_many :leads
  has_many :references
  has_many :messages
  has_many :ratings
end
