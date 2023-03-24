# frozen_string_literal: true

class StatusChangesQuery
  attr_reader :relation

  def initialize(relation = StatusChange.all)
    @relation = relation
  end

  def by_project(project)
    self.class.new(relation.where(project:))
  end

  def oldest_first
    self.class.new(relation.order(created_at: :asc))
  end
end
