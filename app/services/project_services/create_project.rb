# frozen_string_literal: true

module ProjectServices
  class CreateProject
    include Callable

    def initialize(project_params, user)
      @project_params = project_params
      @user = user
    end

    def call
      create_user
    end

    private

    def create_user
      project = Project.new(project_params)
      project.user = user
      project.save
      project
    end

    attr_reader :project_params, :user
  end
end
