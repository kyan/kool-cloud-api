# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImagesController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/projects/1/shots/1/images')
        .to route_to('images#create', project_id: '1', shot_id: '1')
    end
  end
end
