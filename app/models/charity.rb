class Charity < ActiveRecord::Base
 
 
  has_secure_password
  validates :charity_name,
            presence: true
  validates :applicant_name,
            presence: true
  validates :about,
            presence: true
  validates :phone,
            presence: true
  validates :email,
            presence: true,                   
  # validates :tax_number,
  #           numericality: true,
  #           presence: true,
  #           uniqueness: true,
            format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            }
  def to_s
    "#{first_name} #{last_name}"


end
end

