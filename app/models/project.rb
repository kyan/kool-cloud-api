# frozen_string_literal: true

class Project < ApplicationRecord
  include NameHasher

  has_many :shots

  validates :name, presence: true, uniqueness: true
end
