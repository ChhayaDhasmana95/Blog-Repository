class Post < ApplicationRecord
	belongs_to :user
	has_many  :comments, :dependent => :destroy
	has_one :tag, :dependent => :destroy

	after_create :create_tag

	def create_tag
		Tag.create(name: "View #{self.title} Post",post_id: self.id)
	end
end
