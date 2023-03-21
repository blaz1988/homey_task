require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  context 'when user is logged in' do
    let(:user) { FactoryBot.create(:user) }
    before { session[:user_id] = user.id }

    describe 'GET #show' do
      let(:project) { FactoryBot.create(:project) }
      let(:comment1) { FactoryBot.create(:comment, project: project) }
      let(:comment2) { FactoryBot.create(:comment, project: project) }

      it 'assigns the requested project to @project' do
        get :show, params: { id: project.id }
        expect(assigns(:project)).to eq(project)
      end

      it 'assigns all comments of the requested project to @comments' do
        get :show, params: { id: project.id }
        expect(assigns(:comments)).to match_array([comment1, comment2])
      end

      it 'renders the show template' do
        get :show, params: { id: project.id }
        expect(response).to render_template(:show)
      end
    end

    describe 'GET #index' do

      it 'renders the index template' do
        get :index
        expect(response).to render_template(:index)
      end
    end

    describe 'GET #new' do
      it 'assigns a new project to @project' do
        get :new 
        expect(assigns(:project)).to be_a_new(Project)
      end

      it 'renders the new template' do
        get :new
        expect(response).to render_template(:new)
      end
    end

    describe 'POST #create' do
      context 'with valid attributes' do
        let(:valid_attributes) { FactoryBot.attributes_for(:project) }

        it 'creates a new project' do
          expect {
            post :create, params: { project: valid_attributes }
          }.to change(Project, :count).by(1)
        end

        it 'redirects to the new project' do
          post :create, params: { project: valid_attributes }
          expect(response).to redirect_to(Project.last)
        end
      end

      context 'with invalid attributes' do
        let(:invalid_attributes) { FactoryBot.attributes_for(:project, name: nil) }

        it 'does not save the new project' do
          expect {
            post :create, params: { project: invalid_attributes }
          }.not_to change(Project, :count)
        end

        it 're-renders the new template' do
          post :create, params: { project: invalid_attributes }
          expect(response).to render_template(:new)
        end
      end
    end

    describe 'PATCH #update' do
      let(:project) { FactoryBot.create(:project, status: Project::STATUSES.first) }
      
      context 'with valid attributes' do
        it 'updates the project status' do
          patch :update, params: { id: project.id, project: { status: Project::STATUSES.last } }
          project.reload
          expect(project.status).to eq(Project::STATUSES.last.to_s)
        end

        it 'redirects to the updated project' do
          patch :update, params: { id: project.id, project: { status: Project::STATUSES.last } }
          expect(response).to redirect_to(project_path(project))
        end
      end
      
      context 'with invalid attributes' do
        it 'does not update the project' do
          patch :update, params: { id: project.id, project: { status: nil } }
          project.reload
          expect(project.status).not_to be_nil
        end

        it 're-renders the edit template' do
          patch :update, params: { id: project.id, project: { status: nil } }
          expect(response).to redirect_to(project_path(project))
        end
      end
    end
  end

  context 'when user is not logged in' do
    before { session[:user_id] = nil }

    it "redirects to the login page" do
      get :new 
      expect(response).to redirect_to(login_path)
    end
  end
end
