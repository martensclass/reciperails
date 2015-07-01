class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?
  
  def current_user
    # the ||= means only look it up once per session. 
    #Regular = will constantly poll the database
    @current_user ||= Chef.find(session[:chef_id]) if session[:chef_id]
  end
  
  def logged_in?
    !!current_user #todo - look up what !! means (assertion?) lecture 52 @ 7 min
  end
  
   def require_user
      if !(logged_in?)
         flash[:danger] = "You must be logged in to perform that action"
         redirect_to root_path
      end
   end
    
  
end
