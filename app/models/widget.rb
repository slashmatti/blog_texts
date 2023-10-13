class Widget < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy

  has_one_attached :avatar
end
