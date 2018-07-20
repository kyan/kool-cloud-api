# frozen_string_literal: true

require 'active_support/concern'

module NameHasher
  extend ActiveSupport::Concern

  included do
    before_create :set_tag
  end

  def set_tag
    self.tag = generate_hash
  end

  private

  def generate_hash
    Digest::SHA256.hexdigest "#{title}--#{Time.now}--#{Random.rand(10_000)}"
  end
end
