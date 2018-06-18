# frozen_string_literal: true

class Project < ApplicationRecord
  before_create :set_tag

  def generate_hash
    Digest::SHA256.hexdigest "#{name}--#{Time.now}--#{Random.rand(10_000)}"
  end

  private

  def set_tag
    self.tag = generate_hash
  end
end
