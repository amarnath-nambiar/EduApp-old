class Student < User

 

  default_scope { where(:deleted_at => nil) }

  
  validates :email, uniqueness: { allow_blank: true, case_sensitive: false }
  validates :phone, numericality: true, uniqueness: true, length: { is: 10 }


end
