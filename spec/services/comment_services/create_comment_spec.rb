# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentServices::CreateComment, type: :service do
  let(:user) { FactoryBot.create(:user) }
  let(:project) { FactoryBot.create(:project, user:) }
  let(:valid_comment_params) { { content: 'Test comment', project_id: project.id } }
  let(:invalid_comment_params) { { content: '', project_id: project.id } }

  describe '.call' do
    context 'with valid comment parameters' do
      subject { described_class.call(valid_comment_params, user) }

      it 'creates a new comment' do
        expect { subject }.to change(Comment, :count).by(1)
      end

      it 'returns a comment with the provided content' do
        expect(subject.content).to eq(valid_comment_params[:content])
      end

      it 'assigns the comment to the correct user' do
        expect(subject.user).to eq(user)
      end

      it 'assigns the comment to the correct project' do
        expect(subject.project_id).to eq(valid_comment_params[:project_id])
      end
    end

    context 'with invalid comment parameters' do
      subject { described_class.call(invalid_comment_params, user) }

      it 'does not create a new comment' do
        expect { subject }.not_to change(Comment, :count)
      end
    end
  end
end
