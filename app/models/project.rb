class Project < ApplicationRecord
	has_many :comments
	validates :name, presence: true
	belongs_to :user

	STATUSES = [:not_yet_started, :in_progress, :blocked, :done]
end
