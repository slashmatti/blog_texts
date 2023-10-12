FactoryBot.define do
  factory :message do
    name { "MyString" }
    email { "MyString" }
    telephone { "MyString" }
    content { "MyText" }
    widget { nil }
  end
end
