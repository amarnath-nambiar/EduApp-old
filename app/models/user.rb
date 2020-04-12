class User < ApplicationRecord
  has_secure_password
  default_scope { where(:deleted_at => nil) }
  has_many :leads
  has_many :references
  has_many :messages
  has_many :ratings
  
  validates :first_name, :phone, presence: true
  validates :phone, numericality: true, uniqueness: true, length: { is: 10 }


  after_create :generate_referral_code

  def generate_password_token!
    self.reset_password_token = generate_token
    self.reset_password_sent_at = Time.now.utc
    save!
  end

  def password_token_valid?
    (self.reset_password_sent_at + 3.hours) > Time.now.utc
  end

  def reset_password!(password)
    self.reset_password_token = nil
    self.password = password
    save!
  end

  private

  def generate_token
    SecureRandom.hex(10)
  end

  def generate_referral_code
    self.referred_by = self.referral_code.to_i(16) if self.referral_code.present?
    self.referral_code = self.id.to_s(16).upcase
    self.save
  end

  
end
