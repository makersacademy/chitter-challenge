require './app/models/peep'

RSpec.describe Peep do

  before(:each) do
    test_db_initialise
  end

  it 'should return all peeps' do
    expect(Peep.all[0].message).to include('first peep in the test database')
    expect(Peep.all[5].message).to include('sixth peep in the test database')
  end

end
