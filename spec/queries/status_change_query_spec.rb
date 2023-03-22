require 'rails_helper'

RSpec.describe StatusChangesQuery, type: :query do
  let(:project) { FactoryBot.create(:project) }
  let(:other_project) { FactoryBot.create(:project) }
  let(:status_change1) { FactoryBot.create(:status_change, project: project, created_at: 1.day.ago) }
  let(:status_change2) { FactoryBot.create(:status_change, project: project, created_at: 2.days.ago) }
  let(:status_change3) { FactoryBot.create(:status_change, project: other_project) }

  describe '#by_project' do
    it 'returns status changes belonging to the given project' do
      status_changes = StatusChangesQuery.new.by_project(project).relation
      expect(status_changes).to contain_exactly(status_change1, status_change2)
    end
  end

  describe '#oldest_first' do
    it 'returns status changes sorted by created_at in ascending order' do
      status_changes = StatusChangesQuery.new(project.status_changes).oldest_first.relation
      expect(status_changes).to eq([status_change2, status_change1])
    end
  end
end
