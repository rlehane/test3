class User < ActiveRecord::Base
  rolify
  searchkick

  resourcify
  acts_as_voter

  rolify :before_add => :before_add_method
    def before_add_method(role)
      # do something before it gets added
    end


  has_many :jobs
  has_many :notes, dependent: :destroy

  acts_as_taggable
  has_secure_password

  has_many :jobs, dependent: :destroy

                  
  validates :email,
            presence: true,
            uniqueness: true,
            format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            }
  def to_s
    "#{first_name} #{last_name}"

  end 


   private 
  def set_priority
    if user.has_role? :admin
      self.priority = 3
    end
  end


  has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end
