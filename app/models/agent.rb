class Agent < ApplicationRecord
  has_secure_password
  default_scope { where(:deleted_at => nil) }

  has_many :colleges

  validates :first_name, :phone, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { allow_blank: true, case_sensitive: false }
  validates :phone, numericality: true, uniqueness: true, length: { is: 10 }

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

end
