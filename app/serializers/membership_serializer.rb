# frozen_string_literal: true

class MembershipSerializer < ActiveModel::Serializer
  attributes :project_id, :user_id, :role

  belongs_to :user

  class UserSerializer < ActiveModel::Serializer
    attributes :email
  end
end
