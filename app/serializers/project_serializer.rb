# frozen_string_literal: true

class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :status

  has_many :memberships
  has_many :shots
end
