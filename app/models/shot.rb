# frozen_string_literal: true

class Shot < ApplicationRecord
  include NameHasher

  belongs_to :project

  validates :title, presence: true, uniqueness: { scope: :project_id }
end
