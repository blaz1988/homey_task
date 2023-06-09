# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should validate_presence_of(:content) }

  it { should belong_to(:project) }
  it { should belong_to(:user) }
end
