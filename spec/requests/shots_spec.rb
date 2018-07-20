# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Shots', type: :request do
  describe 'GET /projects/1/shots' do
    let!(:shot_1) { create(:shot, title: 'Expected shot') }

    it 'returns 200 status' do
      get project_shots_path(shot_1.project)
      expect(response).to have_http_status(200)
    end

    context 'scoped to project' do
      let!(:shot_2) { create(:shot) }

      it 'returns correct shots' do
        get project_shots_path(shot_1.project)
        expect(response.body).to include(shot_1.title)
        expect(response.body).to_not include(shot_2.title)
      end
    end
  end
end
