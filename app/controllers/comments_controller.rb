class CommentsController < ApplicationController
	before_action :set_post_value
    
	def create
	  @post = Post.find_by(id: params[:post_id])
	  @post.comments.create(text: params[:text], user_id: current_user.id)
	  flash[:notice] = "Your comment is Posted"
      @posts = Post.all
	end

	def show_all_comments
	  @post = Post.find_by(id: params[:id]).includes(:comments)
	  @comments = @post.comments
	end

end
