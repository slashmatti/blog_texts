class Message < ApplicationRecord
  FREE_MESSAGES_LIMIT = 50

  belongs_to :widget

  scope :newest_to_oldest, -> { order(created_at: :desc) }
  scope :oldest_to_newest, -> { order(created_at: :asc) }

  validates_presence_of :name, :email, :content

  def user
    widget.user
  end

  def notify_user
    return if !user.paying_customer? && user.messages.count >= FREE_MESSAGES_LIMIT

    #SmsService.new(self).send_text! if user.phone? #comment out to not use Ryan's sms server
    MessagesMailer.notification(self).deliver
  end
  handle_asynchronously :notify_user

  def self.to_csv(messages)
    CSV.generate do |csv|
      csv << ['created_at', 'name', 'email', 'content']
      
      messages.each do |message|
        csv << [message.created_at, message.name, message.email, message.content]
      end
    end
  end
end