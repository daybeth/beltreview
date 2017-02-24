class CommentsController < ApplicationController
	before_action :require_login
  def create
  	user = User.find(session[:user_id])
  	event = Event.find(params[:id])
    comment = user.comments.create(:event => event,content: params[:content])
    if comment.save
    	redirect_to "/events/#{event.id}"
   else
	    flash[:errors] = ["Can't be blank"]
	    redirect_to :back
  end  

  end
end
