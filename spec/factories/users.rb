FactoryBot.define do
  factory :user do
    email {"person@mail.com"}
		password {"password"}
		role { 0 }
  end
end
