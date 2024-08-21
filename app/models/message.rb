class Message < ApplicationRecord
  belongs_to :widget

  scope :newest_to_oldest, -> { order(created_at: :desc) }
  validates_presence_of :name, :email, :content

  def user
    widget.user
  end

  def notify_user
    #SmsService.new(self).send_text! if user.phone? #comment out to not use Ryan's sms server
    MessagesMailer.notification(self).deliver
  end

  def self.to_csv(messages)
    CSV.generate do |csv|
      csv << ['created_at', 'name', 'email', 'content']
      
      messages.each do |message|
        csv << [message.created_at, message.name, message.email, message.content]
      end
    end
  end
end