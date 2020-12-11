class UsersController < ApplicationController
  before_action :require_login, only: [:show]
  def new

  end

  def create
    
    new_user = User.create(user_params)
    session[:user_id] = new_user.id
    redirect_to user_path(new_user)
  end

  def show

    if params[:attraction_id]
      ride = Ride.create(user_id: params[:id], attraction_id: params[:attraction_id])
      flash[:notice] = ride.take_ride
    end
    @user = User.find_by(id: params[:id])
  end

  def ride
    ride = Ride.create(user_id: params[:id], attraction_id: params[:attraction_id])
    byebug
  end
  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
  end

  def require_login
    redirect_to root_path unless session.include? :user_id
  end
end
