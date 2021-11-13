# frozen_string_literal: true

require 'peeps'

describe Peeps do
  describe '.all' do
    it 'Returns a full list of peeps from the database' do
      expect(Peeps.all.count).to eq 3
    end
  end
end
