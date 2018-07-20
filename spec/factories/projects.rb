# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    sequence(:title) { |n| "Test project #{n}" }
    description 'A public project description'
    status 'public'

    after(:create) do |project|
      create(:membership, project: project)
    end

    trait :private do
      description 'A private project description'
      status 'private'
    end
  end
end
