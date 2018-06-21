# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShotsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Shot. As you add validations to Shot, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ShotsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      shot = Shot.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      shot = Shot.create! valid_attributes
      get :show, params: { id: shot.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Shot' do
        expect do
          post :create, params: { shot: valid_attributes }, session: valid_session
        end.to change(Shot, :count).by(1)
      end

      it 'renders a JSON response with the new shot' do
        post :create, params: { shot: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(shot_url(Shot.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new shot' do
        post :create, params: { shot: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested shot' do
        shot = Shot.create! valid_attributes
        put :update, params: { id: shot.to_param, shot: new_attributes }, session: valid_session
        shot.reload
        skip('Add assertions for updated state')
      end

      it 'renders a JSON response with the shot' do
        shot = Shot.create! valid_attributes

        put :update, params: { id: shot.to_param, shot: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the shot' do
        shot = Shot.create! valid_attributes

        put :update, params: { id: shot.to_param, shot: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested shot' do
      shot = Shot.create! valid_attributes
      expect do
        delete :destroy, params: { id: shot.to_param }, session: valid_session
      end.to change(Shot, :count).by(-1)
    end
  end
end
