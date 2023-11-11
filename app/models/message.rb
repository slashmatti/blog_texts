class Message < ApplicationRecord
  belongs_to :widget

  scope :newest_to_oldest, -> { order(created_at: :desc) }
  validates_presence_of :name, :email, :content
end
