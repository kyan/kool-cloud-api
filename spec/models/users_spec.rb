# frozen_string_literal: true

require 'rails_helper'
require 'cancan/matchers'

RSpec.describe User, type: :model do
  it { should have_many(:projects) }
  it { should have_many(:memberships) }

  describe 'abilities' do
    subject(:ability) { Ability.new(user) }
  end
end
