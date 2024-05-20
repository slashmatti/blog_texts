class Message < ApplicationRecord
  belongs_to :widget

  scope :newest_to_oldest, -> { order(created_at: :desc) }
  validates_presence_of :name, :email, :content

  def self.to_csv(messages)
    CSV.generate do |csv|
      csv << ['created_at', 'name', 'email', 'content']
      
      messages.each do |message|
        csv << [message.created_at, message.name, message.email, message.content]
      end
    end
  end
end