class EventsController < ApplicationController
  before_action :require_login
  def index
    @user = User.find(session[:user_id])
    @events = Event.all
    @states = states
  end

  def new
  end

  def create
    user = User.find(session[:user_id])
    test= user.events.create(name: params[:name], date: params[:date], location: params[:location], state: params[:state])
    redirect_to '/events'
  end

  def edit
    @event = Event.find(params[:id]) 
    @states = states  
  end

  def update
    user = User.find(session[:user_id])
    event = Event.find(params[:id])
    update = event.update(:user => user, name: params[:name], date: params[:date], location: params[:location], state: params[:state])
    if update
      redirect_to "/events/#{event.id}"
    else
      flash[:errors] = ["User invalid"]
      redirect_to :back
    end  
  end

  def show
    @event = Event.find(params[:id])   
  end

  def destroy
    event = Event.find(params[:id]).destroy
    redirect_to "/events"
  end
  def states
     ["CA","FL","AL", "AK", "AZ"]
  end
end
