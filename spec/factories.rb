FactoryGirl.define do
  factory :user do
    sequence(:name)       { |n| "niranjan #{n}" }
    sequence(:email)      { |n| "nrbramadas#{n}@gmail.com"}
    password              "stuffstuff"
    password_confirmation "stuffstuff"
  end

  factory :task do
    sequence(:title)      { |n| "Title #{n}" }
    sequence(:body)       { |n| "Body #{n} "}
    user_id               1
  end

  factory :tag do
    sequence(:tag_name)   { |n| "Tag Name #{n}" }
  end
end