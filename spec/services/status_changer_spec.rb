RSpec.describe ProjectServices::StatusChanger do
  let(:project) { FactoryBot.create(:project, status: Project::STATUSES.first) }
  let(:status) { Project::STATUSES.last.to_s }

  describe "#call" do
    subject { described_class.call(project, status) }

    it "updates the project status" do
      expect{ subject }.to change{ project.reload.status }.from(project.status).to(status)
    end
  end
end
