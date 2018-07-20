# frozen_string_literal: true

class Membership < ApplicationRecord
  belongs_to :project
  belongs_to :user
end
