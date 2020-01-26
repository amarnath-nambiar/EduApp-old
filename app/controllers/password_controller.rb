class PasswordController < ApplicationController
  def forgot
    if params[:email].blank? # check if email is present
      return render json: {error: 'Email not present'}
    end

    agent = Agent.find_by(email: params[:email]) # if present find agent by email

    if agent.present?
      agent.generate_password_token! #generate pass token
      AgentMailer.forgot_password_email(agent, agent.reset_password_token).deliver_now
      render json: {status: 'ok'}, status: :ok
    else
      render json: {error: ['Email address not found. Please check and try again.']}, status: :not_found
    end
  end

  def reset
    token = params[:token].to_s

    if params[:email].blank?
      return render json: {error: 'Token not present'}
    end

    agent = Agent.find_by(reset_password_token: token)
    if agent.present?  && agent.password_token_valid?
      if agent.reset_password!(params[:password])
        render json: {status: 'ok'}, status: :ok
      else
        render json: {error: agent.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {error:  ['Link not valid or expired. Try generating a new link.']}, status: :not_found
    end
  end
end
