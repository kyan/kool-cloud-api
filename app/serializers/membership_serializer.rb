# frozen_string_literal: true

class MembershipSerializer < ActiveModel::Serializer
  attributes :project_id, :user_id, :role

  has_many :users
end
