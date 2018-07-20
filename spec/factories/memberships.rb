# frozen_string_literal: true

FactoryBot.define do
  factory :membership do
    project
    user
    role 'animator'
  end
end
