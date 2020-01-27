class AgentMailer < ApplicationMailer
  def forgot_password_email(agent,token)
    @agent = agent
    @token = token
    mail(to: @agent.email, subject: ' Please reset your password')
  end
end

