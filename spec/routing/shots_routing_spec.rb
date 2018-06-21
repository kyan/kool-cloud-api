# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShotsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/projects/1/shots').to route_to('shots#index', project_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/projects/1/shots/1').to route_to('shots#show', project_id: '1', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/projects/1/shots').to route_to('shots#create', project_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/projects/1/shots/1').to route_to('shots#update', project_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/projects/1/shots/1').to route_to('shots#update', project_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/projects/1/shots/1').to route_to('shots#destroy', project_id: '1', id: '1')
    end
  end
end
