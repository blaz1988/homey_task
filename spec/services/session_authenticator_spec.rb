# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionAuthenticator, type: :service do
  describe '#authenticate' do
    let(:email) { 'user@example.com' }
    let(:password) { 'password' }
    let(:authenticator) { described_class.new(email, password) }

    context 'when user exists' do
      before do
        FactoryBot.create(:user, email:, password: 'password', password_confirmation: 'password')
      end

      context 'with valid password' do
        it 'returns true' do
          expect(authenticator.authenticate).to eq(true)
        end

        it 'does not set an error' do
          authenticator.authenticate
          expect(authenticator.error).to be_nil
        end
      end

      context 'with invalid password' do
        let(:password) { 'wrong password' }

        it 'returns false' do
          expect(authenticator.authenticate).to eq(false)
        end

        it 'sets an error for invalid password' do
          authenticator.authenticate
          expect(authenticator.error).to eq('Invalid password')
        end
      end
    end

    context 'when user does not exist' do
      it 'returns false' do
        expect(authenticator.authenticate).to eq(false)
      end

      it 'sets an error for non-existent user' do
        authenticator.authenticate
        expect(authenticator.error).to eq('User does not exist')
      end
    end
  end
end
