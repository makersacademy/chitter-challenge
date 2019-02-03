require './app/models/peep'

Test_message = "Hey @al123, how are you?"

RSpec.describe Peep do

  before(:each) do
    test_db_initialise
  end

  it 'should return all peeps' do
    expect(Peep.all[0].message).to include('first peep in the test database')
    expect(Peep.all[5].message).to include('sixth peep in the test database')
  end

  it 'should identify a username in a peep' do
    expect(Peep.find_username(Test_message)).to eq 'al123'
  end

end
