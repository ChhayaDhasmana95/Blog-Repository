class ApplicationController < ActionController::Base

  def set_post_value
  	@posts = Post.where(is_published: true).order(created_at: "desc").includes(:comments)
  end
  


	# protected
	# def after_sign_in_path_for(resource)
 #      new_user_registration_path
 #    end

    # def after_sign_up_path_for(resource)
    #   new_user_session_path(resource)
    # end

    # protected
    # def after_sign_up_path_for(resource)
    #   signed_in_root_path(resource)
    # end

    # def after_update_path_for(resource)
    #   signed_in_root_path(resource)
    # end
end
