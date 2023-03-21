class CommentsController < ApplicationController
  before_action :authorize

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to project_path(@comment.project_id)
    else
      flash[:error] = @comment.errors.full_messages.join(', ')
      redirect_to project_path(@comment.project_id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id).merge(project_id: params[:project_id])
  end
end
