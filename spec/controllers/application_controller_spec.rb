# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  controller do
    before_action :authorize

    def index
      render plain: 'Authorized'
    end
  end

  describe '#current_user' do
    it 'returns the current user' do
      session[:user_id] = user.id
      expect(controller.current_user).to eq(user)
    end
  end

  describe '#logged_in?' do
    context 'when a user is logged in' do
      before { allow(controller).to receive(:current_user).and_return(user) }

      it 'returns true' do
        expect(controller.logged_in?).to be(true)
      end
    end

    context 'when a user is not logged in' do
      before { allow(controller).to receive(:current_user).and_return(nil) }

      it 'returns false' do
        expect(controller.logged_in?).to be(false)
      end
    end
  end

  describe '#authorize' do
    context 'when the user is logged in' do
      before do
        session[:user_id] = user.id
      end

      it 'allows access to the page' do
        get :index
        expect(response).to have_http_status(:ok)
        expect(response.body).to eq 'Authorized'
      end
    end

    context 'when the user is not logged in' do
      before do
        session[:user_id] = nil
      end

      it 'redirects to the login page' do
        get :index
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(login_path)
        expect(flash[:alert]).to eq 'You must be logged in to access this page.'
      end
    end
  end
end
