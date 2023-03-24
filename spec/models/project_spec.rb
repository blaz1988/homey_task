# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:comments) }
  it { should belong_to(:user) }
  it 'should have correct statuses' do
    expect(Project::STATUSES).to eq(%i[not_yet_started in_progress blocked done])
  end
end
