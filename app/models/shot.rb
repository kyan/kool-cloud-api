# frozen_string_literal: true

class Shot < ApplicationRecord
  include NameHasher

  belongs_to :project, optional: true
end
