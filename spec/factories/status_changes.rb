# frozen_string_literal: true

FactoryBot.define do
  factory :status_change do
    association :project
    from_status { Project::STATUSES.sample.to_s }
    to_status { Project::STATUSES.reject { |s| s == from_status.to_sym }.sample.to_s }
    association :user
  end
end
