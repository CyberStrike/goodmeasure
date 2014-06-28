class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :submission

  validates :content, presence: true
end
