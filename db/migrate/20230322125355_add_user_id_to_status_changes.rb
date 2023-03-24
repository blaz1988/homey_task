# frozen_string_literal: true

class AddUserIdToStatusChanges < ActiveRecord::Migration[6.1]
  def change
    add_column :status_changes, :user_id, :bigint
  end
end
