class User < ActiveRecord::Base
 
  has_secure_password
  validates :first_name,
            presence: true
  validates :last_name,
            presence: true
  validates :occupation,
            presence: true
  validates :location,
            presence: true
  validates :about,
            presence: true                    
  validates :email,
            presence: true,
            uniqueness: true,
            format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            }
  def to_s
    "#{first_name} #{last_name}"


end


  has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "100x100>" } 
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/



end