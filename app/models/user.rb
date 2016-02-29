class User < ActiveRecord::Base
 

  has_many :jobs
  has_many :notes, dependent: :destroy

  acts_as_taggable
  has_secure_password

  has_many :jobs, dependent: :destroy
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
  validates :tag_list,
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


  has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/



end