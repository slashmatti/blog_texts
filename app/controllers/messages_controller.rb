class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :set_widget, only: [:create]
  
  def index
    if current_user.paying_customer?
      @messages = current_user.messages.newest_to_oldest
    else
      @messages = current_user.messages.oldest_to_newest.limit(Message::FREE_MESSAGES_LIMIT).order(created_at: :desc)
    end

    respond_to do |format|
      format.html { @messages }
      format.csv { send_data(Message.to_csv(@messages), filename: "#{ENV['company_name']} messages - #{Date.today}.csv") }
    end
  end

  def create
    if @widget.enabled?
      message = @widget.messages.create!(message_params)
      message.notify_user
    end
    
    head :ok
  end

  private

  def set_widget
    @widget = Widget.find_by(client_id: params[:client_id])
    # @widget = Widget.last # TODO: delete this line
  end

  def message_params
    params.require(:message).permit(:name, :email, :content)
  end
end
