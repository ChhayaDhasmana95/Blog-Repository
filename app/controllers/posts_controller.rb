class PostsController < ApplicationController
	
	def index
		@posts = Post.where(is_published: true).order(created_at: "desc").includes(:comments)
	end

	def show
		@post = Post.find_by(id: params[:id]).includes(:comments)
	end

end
