# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:valid_attributes) { FactoryBot.attributes_for(:user) }

      it 'creates a new user' do
        expect do
          post :create, params: { user: valid_attributes }
        end.to change(User, :count).by(1)
      end

      it 'logs in the user' do
        post :create, params: { user: valid_attributes }
        expect(session[:user_id]).to eq(User.last.id)
      end

      it 'redirects to the root URL' do
        post :create, params: { user: valid_attributes }
        expect(response).to redirect_to(root_url)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { FactoryBot.attributes_for(:user, email: '') }

      it 'does not create a new user' do
        expect do
          post :create, params: { user: invalid_attributes }
        end.not_to change(User, :count)
      end

      it 'renders the new template' do
        post :create, params: { user: invalid_attributes }
        expect(response).to render_template('new')
      end
    end
  end
end
