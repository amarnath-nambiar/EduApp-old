class Student < ApplicationRecord
  has_secure_password
  default_scope { where(:deleted_at => nil) }

  has_many :leads
  has_many :references
  has_many :messages
  has_many :ratings

  validates :first_name, :phone, presence: true
  validates :email, uniqueness: { allow_blank: true, case_sensitive: false }
  validates :phone, numericality: true, uniqueness: true, length: { is: 10 }

  after_create :generate_referral_code

  def generate_referral_code
    self.referred_by = self.referral_code.to_i(16) if self.referral_code.present?
    self.referral_code = self.id.to_s(16).upcase
    self.save
  end

end
