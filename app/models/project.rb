# frozen_string_literal: true

class Project < ApplicationRecord
  include NameHasher

  has_many :shots
  has_many :memberships
  has_many :users, through: :memberships

  accepts_nested_attributes_for :memberships

  validates :title, presence: true, uniqueness: true

  scope :public_viewable, -> { where(status: 'public') }
end
