# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:valid_attributes) { attributes_for(:project) }
  let(:invalid_attributes) { { title: '' } }
  let(:valid_session) { {} }

  describe 'GET #index' do
    let!(:project) { create(:project) }

    it 'returns a success response' do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    let(:project) { create(:project) }

    it 'returns a success response' do
      get :show, params: { id: project.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Project' do
        expect do
          post :create, params: { project: valid_attributes }, session: valid_session
        end.to change(Project, :count).by(1)
      end

      it 'renders a JSON response with the new project' do
        post :create, params: { project: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(project_url(Project.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new project' do
        post :create, params: { project: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { attributes_for(:project) }

      it 'updates the requested project' do
        project = Project.create! valid_attributes
        put :update, params: {
          id: project.to_param, project: new_attributes
        }, session: valid_session
        project.reload
        expect(project.title).to eq(new_attributes[:title])
      end

      it 'renders a JSON response with the project' do
        project = Project.create! valid_attributes

        put :update, params: {
          id: project.to_param, project: valid_attributes
        }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the project' do
        project = Project.create! valid_attributes

        put :update, params: {
          id: project.to_param, project: invalid_attributes
        }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested project' do
      project = Project.create! valid_attributes
      expect do
        delete :destroy, params: { id: project.to_param }, session: valid_session
      end.to change(Project, :count).by(-1)
    end
  end
end
