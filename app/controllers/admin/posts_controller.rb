class Admin::PostsController < ApplicationController
  before_action :is_admin

	def index
		@posts = Post.all
	end

	def new
		@post = current_user.posts.new()
	end

	def create
		@post = current_user.posts.create(post_params)
		if @post.save
			flash[:success] = "Post Created Successfully"
			redirect_to admin_posts_path
		else
			flash[:error] = @post.errors.full_messages.join(', ')
		end
	end
	

	def edit
		@post = Post.find_by(id: params[:id])
	end

	def update
		@post = Post.find_by(id: params[:id])
		if @post.update(post_params)
			flash[:success] = "Post Updated Successfully"
			redirect_to admin_posts_path
		else
			flash[:error] = @post.errors.full_messages.join(', ')
		end
	end

	def destroy
		@post = Post.find_by(id:params[:id])
		@post.destroy		
		flash[:notice] = "Post deleted Successfully"
		@posts = Post.all
	end

	def is_admin
		unless current_user.admin?
      flash[:error] = "You are not authorized to access this page"
		end
	end
  private
	def post_params
		params.require(:post).permit(:title,:content,:is_published)
	end
end
