FactoryBot.define do
  factory :article do
    title { "MyString" }
		content { "It is a beautiful day" }
		status { "free" }
		category
  end
end
