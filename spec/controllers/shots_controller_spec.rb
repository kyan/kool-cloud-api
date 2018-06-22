# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShotsController, type: :controller do
  let(:valid_attributes) { attributes_for(:shot) }
  let(:invalid_attributes) { { name: '' } }
  let(:valid_session) { {} }

  describe 'GET #index' do
    let!(:shot) { create(:shot) }

    it 'returns a success response' do
      get :index, params: { project_id: shot.project.id }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    let(:shot) { create(:shot) }

    it 'returns a success response' do
      get :show, params: { project_id: shot.project.id, id: shot.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:project) { create(:project) }

    context 'with valid params' do
      it 'creates a new Shot' do
        expect do
          post :create, params: {
            project_id: project.id, shot: valid_attributes
          }, session: valid_session
        end.to change(Shot, :count).by(1)
      end

      it 'renders a JSON response with the new shot' do
        post :create, params: {
          project_id: project.id, shot: valid_attributes
        }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new shot' do
        post :create, params: {
          project_id: project.id, shot: invalid_attributes
        }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:shot) { create(:shot) }
      let(:new_attributes) { { name: 'a different name' } }

      it 'updates the requested shot' do
        put :update, params: {
          project_id: shot.project.id, id: shot.to_param, shot: new_attributes
        }, session: valid_session
        shot.reload
        expect(shot.name).to eq(new_attributes[:name])
      end

      it 'renders a JSON response with the shot' do
        put :update, params: {
          project_id: shot.project.id, id: shot.to_param, shot: valid_attributes
        }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      let(:shot) { create(:shot) }

      it 'renders a JSON response with errors for the shot' do
        put :update, params: {
          project_id: shot.project.id, id: shot.to_param, shot: invalid_attributes
        }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:shot) { create(:shot) }

    it 'destroys the requested shot' do
      expect do
        delete :destroy, params: {
          project_id: shot.project.id, id: shot.to_param
        }, session: valid_session
      end.to change(Shot, :count).by(-1)
    end
  end
end
