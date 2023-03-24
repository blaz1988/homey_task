# frozen_string_literal: true

module ProjectServices
  class StatusChanger
    include Callable

    def initialize(project, status, user)
      @project = project
      @status = status
      @user = user
    end

    def call
      change_status
    end

    private

    attr_reader :project, :status, :user

    def change_status
      previous_status = project.status
      project.update_attribute(:status, status)
      create_status_change_record(previous_status, status) if previous_status != status
    end

    def create_status_change_record(from_status, to_status)
      project.status_changes.create(from_status:, to_status:, user:)
    end
  end
end
