FactoryGirl.define do
  factory :user do
    username "jetskee"
    password  "nooneknows"
    email { "#{username}@test.com" }
#    admin false
  end
end 
