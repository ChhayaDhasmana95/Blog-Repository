class CommentsController < ApplicationController
	before_action :set_post_value
    before_action :check_user_login    
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

    
  def check_user_login
   unless current_user && current_user.admin?
     flash[:error]="Please login first."
       redirect_to index_path
   end
  end

end
