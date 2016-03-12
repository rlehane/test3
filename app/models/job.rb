class Job < ActiveRecord::Base


acts_as_votable

searchkick

belongs_to :user
belongs_to :category
has_many :notes

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

  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
