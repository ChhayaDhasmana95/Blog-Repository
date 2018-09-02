class Post < ApplicationRecord
	belongs_to :user
	has_many  :comments
	has_one :tag

	after_create :create_tag

	def create_tag
		Tag.create(name: "View #{self.title} Post",post_id: self.id)
	end
end
