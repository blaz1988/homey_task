# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authorize

  def create
    @comment = CommentServices::CreateComment.call(comment_params, current_user)
    if @comment.persisted?
      flash[:notice] = 'Comment was successfully created.'
    else
      flash[:error] = @comment.errors.full_messages.join(', ')
    end
    redirect_to project_path(@comment.project_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id).merge(project_id: params[:project_id])
  end
end
