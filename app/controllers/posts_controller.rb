class PostsController < ApplicationController
	before_action :set_post_value
	def index
		@posts = Post.where(is_published: true).order(created_at: "desc").includes(:comments)
	end

	def details
		@post = Post.includes(:comments).find_by(id: params[:id])
	end
  
  def show
		@post = Post.includes(:comments).find_by(id: params[:id])
	end

end
