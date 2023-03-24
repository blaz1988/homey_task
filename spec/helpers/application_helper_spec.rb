# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#format_date' do
    let(:date) { DateTime.new(2023, 3, 10, 13, 45) }
    let(:formatted_date) { helper.format_date(date) }

    it 'formats the date correctly' do
      expect(formatted_date).to eq('Mar 10, 2023 01:45 PM')
    end
  end
end
