class ApplicationController < ActionController::Base
	add_flash_types :danger, :success
	helper_method :current_user, :signed_in?, :return_if_signed_in

	def current_user    
    User.find_by(id: session[:user_id])  
	end

	def signed_in?   
    !current_user.nil?  
	end

	def return_if_signed_in
  	if signed_in?
  		flash[:danger] = "You are currently logged in"
  		redirect_to root_path
  	end
  end
end
