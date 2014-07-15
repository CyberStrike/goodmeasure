class RelatedMaterial < ActiveRecord::Base
  belongs_to :attachable
  has_attached_file :file, 
  validates :file, presence: true
end
