class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :set_widget, only: [:create]
  
  def index
    @messages = current_user.messages.newest_to_oldest
  end

  def create
    @widget.messages.create!(message_params)
    head :ok
  end

  private

  def set_widget
    @widget = Widget.find_by(client_id: params[:client_id])
    @widget = Widget.last # TODO: delete this line
  end

  def message_params
    params.require(:message).permit(:name, :email, :content)
  end
end
