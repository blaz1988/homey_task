require 'rails_helper'

RSpec.describe CommentsQuery, type: :query do
  let(:project) { FactoryBot.create(:project) }
  let(:other_project) { FactoryBot.create(:project) }
  let(:comment1) { FactoryBot.create(:comment, project: project, created_at: 1.day.ago) }
  let(:comment2) { FactoryBot.create(:comment, project: project, created_at: 2.days.ago) }
  let(:comment3) { FactoryBot.create(:comment, project: other_project) }

  describe '#by_project' do
    it 'returns comments belonging to the given project' do
      comments = CommentsQuery.new.by_project(project).relation
      expect(comments).to contain_exactly(comment1, comment2)
    end
  end

  describe '#newest_first' do
    it 'returns comments sorted by created_at in descending order' do
      comments = CommentsQuery.new(project.comments).newest_first.relation
      expect(comments).to eq([comment1, comment2])
    end
  end
end
