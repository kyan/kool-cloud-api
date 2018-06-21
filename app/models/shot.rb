# frozen_string_literal: true

class Shot < ApplicationRecord
  include NameHasher

  belongs_to :project

  validates_uniqueness_of :name, scope: :project_id
end
