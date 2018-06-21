# frozen_string_literal: true

class Project < ApplicationRecord
  include NameHasher

  has_many :shots

  validates_uniqueness_of :name
end
