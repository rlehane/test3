class Job < ActiveRecord::Base
resourcify

acts_as_votable

searchkick

belongs_to :user
belongs_to :category
has_many :notes
  
  validates :user_id, presence: true
  validates :title,
            presence: true
  validates :charity,
            presence: true
  validates :description,
            presence: true
  validates :date,
            presence: true
  validates :time,
            presence: true
  validates :no_vols,
            presence: true
  validates :location,
            presence: true

    has_attached_file :image,
    :storage => :s3,
    :bucket => 'tfc1',
    :s3_credentials => {
      :access_key_id => 'AKIAJG3BFNU2BBOPPCJQ',
      :secret_access_key => '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'
    }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
