FactoryBot.define do
  factory :widget do
    name { "MyString" }
    welcome_message { "MyString" }
    background_color { "MyString" }
    shape { "MyString" }
    location { "MyString" }
    enabled { false }
    user { nil }
  end
end
