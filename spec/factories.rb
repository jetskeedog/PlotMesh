FactoryGirl.define do
  factory :user do
    username "jetskee"
    password  "nooneknows"
    email { "#{username}@test.com" }
  end
end
FactoryGirl.define do
  factory :admin do
    username "theadmin"
    password  "nooneknows"
    email { "#{username}@test.com" }
  end
end

