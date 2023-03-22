RSpec.describe ProjectServices::StatusChanger do
  let(:project) { FactoryBot.create(:project, status: Project::STATUSES.first) }
  let(:status) { Project::STATUSES.last.to_s }
  let(:user) { FactoryBot.create(:user) }

  describe "#call" do
    subject { described_class.call(project, status, user) }

    it "updates the project status" do
      expect { subject }.to change { project.reload.status }.from(project.status).to(status)
    end

    context "when the status changes" do
      it "creates a status change record" do
        expect { subject }.to change { project.status_changes.count }.by(1)
      end

      it "saves the correct from_status and to_status values" do
        subject
        status_change = project.status_changes.last
        expect(status_change.from_status).to eq(Project::STATUSES.first.to_s)
        expect(status_change.to_status).to eq(status)
        expect(status_change.user_id).to eq(user.id)
      end
    end

    context "when the status does not change" do
      let(:status) { project.status }

      it "does not create a status change record" do
        expect { subject }.not_to change { project.status_changes.count }
      end
    end
  end
end