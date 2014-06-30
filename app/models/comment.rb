class Comment < ActiveRecord::Base

	default_scope { order(id: :asc) }

	belongs_to :user
	belongs_to :commentable, polymorphic: true

	validates_presence_of :content, :user, :commentable
end