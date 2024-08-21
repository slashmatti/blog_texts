class MessagesMailer < ApplicationMailer

  def notification(message)
    @message = message
    @user = @message.user

    mail(to: @user.email, subject: "New message from #{message.name}")
  end
end
