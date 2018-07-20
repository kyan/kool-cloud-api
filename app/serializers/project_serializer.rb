class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :status

  has_many :memberships
  has_many :shots
end
