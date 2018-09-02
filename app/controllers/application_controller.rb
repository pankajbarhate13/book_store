class ApplicationController < ActionController::API

	attr_reader :current_user

  private
  
  def authenticate_user!
    _, token, email = request.headers['Authorization'].split(' ')
    user = User.where("email = ? and tokens like ?", email, "%#{token}%").first
    if user.present? && user.has_valid_token?(token)
      @current_user = user
    else
      render json: {error: 'Invalid Authorization token'}, status: :unauthorized
    end
  end
  
end
