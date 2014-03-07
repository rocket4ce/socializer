class UsersController < ApplicationController
  respond_to :html, :json
  before_filter :authenticate_user!

  def follow
    @user = User.find(params[:id])
     # => This assumes you have a variable current_user who is authenticated
    if current_user.toggle_follow!(@user)
      redirect_to user_path, :notice => "Lo Sigues"
    else
      redirect_to user_path, :alert => "Ya no lo Sigues"
    end
  end

  # def unfollow
  #   @user = User.find(params[:id])
  #    # => This assumes you have a variable current_user who is authenticated
  #   if current_user.unfollow!(@user)
  #     redirect_to users_path, :notice => "ya no lo sigues"
  #   else
  #     redirect_to users_path, :alert => "Peerro culiao"
  #   end
  # end

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
end