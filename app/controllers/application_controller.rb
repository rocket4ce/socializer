class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

 	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
	private

	  def record_not_found
	    render text: "404 Not Found", status: 404
	  end
end
