class Agent < User
  has_many :colleges
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
end