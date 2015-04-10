require './app/peep'

describe Peep do

  let(:peep) { described_class.first }

  it 'database is empty' do
    described_class.each(&:destroy)
    expect(described_class.count).to eq 0
  end

  before(:each) do
    described_class.create message: 'My first peep',
                           user_name: 'Sanjay Purswani',
                           user_handle: 'sanjsanj'
  end

  after(:each) do
    described_class.each(&:destroy)
  end

  it 'can be created in the database' do
    expect(described_class.count).to eq 1
  end

  it 'can be retrieved from the database' do
    expect(peep.message).to eq 'My first peep'
    expect(peep.user_name).to eq 'Sanjay Purswani'
    expect(peep.user_handle).to eq 'sanjsanj'
  end

  it 'can be deleted from the database' do
    peep.destroy
    expect(described_class.count).to eq 0
  end

end
