FactoryBot.define do
  factory :project do
    name { Faker::Company.name }
    status { Project::STATUSES.first }
    association :user

    trait :with_comments do
      after(:create) do |project|
        create_list(:comment, 3, project: project)
      end
    end
  end
end
