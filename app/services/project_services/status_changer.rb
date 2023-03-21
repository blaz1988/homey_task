module ProjectServices
  class StatusChanger
    include Callable
  
    def initialize(project, status)
      @project = project
      @status = status
    end

    def call
      change_status
    end

    private

    attr_reader :project, :status

    def change_status
      project.update_attribute(:status, status)
    end
  end
end