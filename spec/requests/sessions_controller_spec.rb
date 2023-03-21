require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    let(:user) { FactoryBot.create(:user) }

    context 'with valid credentials' do
      let(:valid_credentials) do
        {
          email: user.email,
          password: user.password
        }
      end

      it 'logs in the user' do
        post :create, params: { session: valid_credentials }
        expect(session[:user_id]).to eq(user.id)
      end

      it 'redirects to the root URL' do
        post :create, params: { session: valid_credentials }
        expect(response).to redirect_to(root_url)
      end
    end

    context 'with invalid credentials' do
      let(:invalid_credentials) do
        {
          email: user.email,
          password: 'wrong_password'
        }
      end

      it 'does not log in the user' do
        post :create, params: { session: invalid_credentials }
        expect(session[:user_id]).to be_nil
      end

      it 'renders the new template' do
        post :create, params: { session: invalid_credentials }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { FactoryBot.create(:user) }

    before do
      post :create, params: { session: { email: user.email, password: user.password } }
    end

    it 'logs out the user' do
      delete :destroy
      expect(session[:user_id]).to be_nil
    end

    it 'redirects to the root URL' do
      delete :destroy
      expect(response).to redirect_to(root_url)
    end
  end
end
