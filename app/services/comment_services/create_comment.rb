# frozen_string_literal: true

module CommentServices
  class CreateComment
    include Callable

    def initialize(comment_params, user)
      @comment_params = comment_params
      @user = user
    end

    def call
      create_comment
    end

    private

    attr_reader :comment_params, :user

    def create_comment
      comment = user.comments.build(comment_params)
      comment.save
      comment
    end
  end
end
