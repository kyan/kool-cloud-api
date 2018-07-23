# frozen_string_literal: true

class Membership < ApplicationRecord
  ROLES = %w[critic owner animator producer].freeze

  belongs_to :project
  belongs_to :user
end
