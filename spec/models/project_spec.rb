# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should have_many(:shots) }
  it { should have_many(:users) }
  it { should have_many(:memberships) }

  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }

  describe 'new' do
    let(:project) { Project.new(title: 'Test Project') }
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

  describe '#public_viewable' do
    let!(:public_project) { create(:project) }
    let!(:private_project) { create(:project, :private) }

    subject { described_class.public_viewable }

    it { is_expected.to include(public_project) }
    it { is_expected.to_not include(private_project) }
  end
end
