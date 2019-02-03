require './app/models/peep'

RSpec.describe Peep do

  before(:each) do
    test_db_initialise
  end

  it 'should return all peeps' do
    expect(described_class.all[0].message).to include('first peep in the test database')
    expect(described_class.all[5].message).to include('sixth peep in the test database')
  end

  it 'should identify a username in a peep' do
    expect(Peep.find_username(TEST_MESSAGE)).to eq 'al123'
  end

end
