require './lib/peep.rb'
require 'database_helper'
require 'pg'

describe Peep do
  describe '#all' do
    it 'returns all peeps' do
      drop_test_database
      populate_test_database
      expect(Peep.all.first.content).to eq 'This is chitter'

    end
  end
end
