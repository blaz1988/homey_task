# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProjectServices::CreateProject, type: :service do
  let(:project_params) { { name: 'ProjectA', user_id: user.id } }
  let(:user) { FactoryBot.create(:user) }

  subject { described_class.call(project_params, user) }

  describe '#call' do
    context 'when valid project params are provided' do
      it 'creates a new project' do
        expect { subject }.to change(Project, :count).by(1)
      end

      it 'assigns the project to the user' do
        expect(subject.user).to eq(user)
        expect(subject.name).to eq('ProjectA')
      end
    end

    context 'when invalid project params are provided' do
      let(:project_params) { {} }

      it 'does not create a new project' do
        expect { subject }.not_to change(Project, :count)
      end
    end
  end
end
