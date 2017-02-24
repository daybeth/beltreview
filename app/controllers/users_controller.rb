class UsersController < ApplicationController
	before_action :require_login, except: [:new, :create]
	# before_action :require_current_user, only: [:edit, :update, :destroy]

  def new
  	@states = states
  end

  def create
  	user = User.new(user_params)

	 if user.save 
  		session[:user_id] = user.id
  		redirect_to "/events"
		else
  		flash[:errors] = user.errors.full_messages
  		redirect_to :back
		end
  end

  def edit
  	@user = User.find(params[:id])
    @states = states
  end

  def update
  	user = User.find(params[:id])
  	user.update(user_params)
  	redirect_to '/events'
  end
  def states
  	 ["CA","FL","AL", "AK", "AZ"]
  end
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :location, :state, :password, :password_confirmation)
  	
  end
end
