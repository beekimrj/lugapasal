class SessionsController < ApplicationController
	before_action :return_if_signed_in, only: [:create, :new]
  def new
  	@user = User.new
  end

  def create
		@user = User.find_by(username: params[:username].downcase)
	  if @user && @user.authenticate(params[:password])
	    session[:user_id] =@user.id
	    flash[:success]="Successfully logged in"
	    redirect_to root_path
	  else
	    flash[:danger]="Username or Password is incorrect"
	    redirect_to login_path
    end
  end

  def destroy     
    session[:user_id] = nil
  	flash[:success] = "Logged out Successfully"
  	redirect_to login_path
  end

end
