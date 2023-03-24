# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :user
  validates :content, presence: true, length: { maximum: 200 }
end
