# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shot, type: :model do
  it { should belong_to(:project) }

  describe 'new' do
    let(:shot) { build(:shot, name: 'Test shot') }
    let(:the_hash) { 'bbb745db665c949a9c0efb06c433e2a77b9ba7d87fd554fc7d34d6e384e5f7e7' }
    before do
      Timecop.freeze('20180101')
      allow(Random).to receive(:rand).and_return(1000)
    end

    after { Timecop.return }

    it 'creates a hashed tag' do
      expect { shot.save }.to change(shot, :tag).from(nil).to(the_hash)
    end
  end
end
