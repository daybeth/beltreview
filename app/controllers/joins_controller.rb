class JoinsController < ApplicationController
	#\before_action :require_current_user, only: [:edit, :update, :destroy]
  def create
  	user = User.find(session[:user_id])
  	event = Event.find(params[:id])
  	join = Join.create(:user => user, :event => event)
  	redirect_to '/events'
  end
  def destroy
    user = User.find(session[:user_id])
    event = Event.find(params[:id])
    Join.where(user:user, event:event).first.destroy
    redirect_to "/events"
  end
end