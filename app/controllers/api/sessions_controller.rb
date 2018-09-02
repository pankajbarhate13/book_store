class Api::SessionsController < ApplicationController

	def create
    user = User.find_by(email: params[:email])
    # abort params.inspect
    if user.authenticate(params[:password])
      token = user.generate_token
      render json: token, status: :ok
    else
      render json: { error: "Wrong email or password" }, status: :unauthorized # or 401
    end
  end

end
