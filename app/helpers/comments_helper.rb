# frozen_string_literal: true

module CommentsHelper
  def format_comment_date(date)
    date.strftime('%b %d, %Y %I:%M %p')
  end
end
