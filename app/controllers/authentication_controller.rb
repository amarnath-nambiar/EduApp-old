class AuthenticationController < ApplicationController
  require 'json_web_token'
  before_action :authorize_request, except: :login

  # POST /auth/login
  def login
    @agent = if params[:phone].present?
      User.find_by_phone(params[:phone])
    else
      User.find_by_email(params[:email])
    end
    if @agent&.authenticate(params[:password])
      render json: { token: JsonWebToken.encode(user_id: @agent.id), agent_id: @agent.id }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end