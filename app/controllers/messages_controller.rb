class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_widget
  
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
