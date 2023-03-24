# frozen_string_literal: true

class StatusChange < ApplicationRecord
  belongs_to :project
  belongs_to :user
end
