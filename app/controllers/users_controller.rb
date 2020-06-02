class UsersController < ApplicationController
  before_action :return_if_signed_in, only: [:create, :new]

  def new
    @user = User.new;
  end

  def create
    @user = User.new(user_params)
    @user[:username] = @user[:username].downcase
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:danger]= @user.errors.full_messages.to_sentence
      redirect_to signup_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "Account Deleted"
    redirect_to root_path
  end

  def update
    @user = User.find_by(username: params[:user][:username].downcase)
    if @user && @user.authenticate(params[:old_password])
      if @user.update(user_params)
        flash[:success] = "Updated"
        redirect_to root_path and return
      end
    end
        # byebug
        flash[:danger] = "Old password didn't match"
        redirect_to edit_user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :full_name, :old_password)
  end
end
