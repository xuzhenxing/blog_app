FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :blog do
    title "Lorem ipsum"
    body "Lorem ipsum"
    user
  end

  factory :comments do
    content "Lorem ipsum"
    blog
  end
end