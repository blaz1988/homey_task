require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "POST create" do
    let(:user) { FactoryBot.create(:user) }
    let(:project) { FactoryBot.create(:project) }
    let(:content) { 'Hello, homey!'}

    context "when user is logged in" do
      before do
        session[:user_id] = user.id
        user
        project
      end

      it "creates a new comment" do
        expect {
          post :create, params: { project_id: project.id, comment: { content: content } }
        }.to change { Comment.count }.by(1)

        expect(response).to redirect_to(project_path(project))
        expect(flash[:notice]).to eq("Comment was successfully created.")
      end
    end

    context "when user is not logged in" do
      it "redirects to the login page" do
        post :create, params: { project_id: project.id, comment: { content: content } }

        expect(response).to redirect_to(login_path)
      end
    end
  end
end
