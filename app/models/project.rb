# frozen_string_literal: true

class Project < ApplicationRecord
  include NameHasher

  validates_uniqueness_of :name
end
