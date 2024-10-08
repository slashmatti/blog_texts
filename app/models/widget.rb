class Widget < ApplicationRecord
  include Hashable

  belongs_to :user
  has_many :messages, dependent: :destroy

  has_one_attached :avatar

  validates :name, :welcome_message, :thanks_message, :background_color, :font_color, :shape, :location, presence: true
end
