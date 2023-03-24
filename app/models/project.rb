# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :comments
  has_many :status_changes
  validates :name, presence: true
  belongs_to :user

  STATUSES = %i[not_yet_started in_progress blocked done].freeze
end
