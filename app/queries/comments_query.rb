class CommentsQuery
  attr_reader :relation

  def initialize(relation = Comment.all)
    @relation = relation
  end

  def by_project(project)
    self.class.new(relation.where(project: project))
  end

  def newest_first
    self.class.new(relation.order(created_at: :desc))
  end
end
