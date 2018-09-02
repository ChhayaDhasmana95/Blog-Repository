class PostsController < ApplicationController
	
	def index
		@posts = Post.where(is_published: true).order(created_at: "desc")
	end

end
