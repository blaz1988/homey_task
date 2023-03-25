# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserServices::CreateUser do
  let(:user_params) do
    {
      name: 'John Doe',
      email: 'john.doe@example.com',
      password: 'password',
      password_confirmation: 'password'
    }
  end

  describe '#call' do
    subject { described_class.call(user_params) }

    context 'when given valid parameters' do
      it 'creates a new user' do
        expect { subject }.to change(User, :count).by(1)
      end

      it 'returns the newly created user' do
        expect(subject).to be_a(User)
        expect(subject.name).to eq('John Doe')
        expect(subject.email).to eq('john.doe@example.com')
      end
    end

    context 'when given invalid parameters' do
      let(:user_params) do
        {
          name: '',
          email: '',
          password: '',
          password_confirmation: ''
        }
      end

      it 'does not create a new user' do
        expect { subject }.not_to change(User, :count)
      end
    end
  end
end
