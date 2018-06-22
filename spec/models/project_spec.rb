# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should have_many(:shots) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  describe 'new' do
    let(:project) { Project.new(name: 'Test Project') }
    let(:the_hash) { 'ac78bb132c5f27d5f8d79225346e2fcd856fe1e143f4577a475a3a2e58593d4c' }
    before do
      Timecop.freeze('20180101')
      allow(Random).to receive(:rand).and_return(1000)
    end

    after { Timecop.return }

    it 'creates a hashed tag' do
      expect { project.save }.to change(project, :tag).from(nil).to(the_hash)
    end
  end
end
