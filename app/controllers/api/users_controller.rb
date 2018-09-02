class Api::UsersController < ApplicationController

	before_action :authenticate_user!, only: :update
  before_action :authorize_self, only: :update

  def create
  	# abort users_params.inspect
    user = User.new(users_params)
    if user.save
      render json: user, status: :ok # or 200
    else
      render json: user.errors, status: :bad_request, adapter: :json_api # or 400
    end
  end
  
  def update
    if current_user.update(users_params)
      render json: current_user.reload, status: :ok
    else
      render json: current_user.errors, status: 406 # or Not Acceptable
    end
  end
  
  private
    def users_params
      params.permit(:email, :password, :password_confirmation)
    end
    
    def authorize_self
      unless current_user.id.to_s == params[:id]
        render json: {error: 'You are not authorized to perform the action'}, status: :forbidden # or 403
      end
    end

end
