class ApplicationController < ActionController::API
  include ActionController::Cookies

  ##
  # Function to get the current user connected

  def current_user
    Current.user
  end

  ##
  # Function to analyze the token in the cookies

  def authentication
    @sessions_service = SessionsService.new
    user = @sessions_service.authentication_session(cookies["Authorization"])
    unless user
      return render json: { status: "error", code: 401, message: "Unauthorized" }, status: 401
    end
    session[:user_id] = user.id
    Current.user = user
    true
  end
end