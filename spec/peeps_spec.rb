require 'peeps'
require 'setup_test_database'

describe Peeps do
  describe '.all' do
    it 'lists all peeps in table' do
      setup_test_database
      all_peeps = Peeps.all
      expect(all_peeps).to include 'this is a test message'
      expect(all_peeps).to include 'this is another test message'
    end
  end
end