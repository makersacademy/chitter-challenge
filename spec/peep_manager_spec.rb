require 'peep_manager.rb'

describe Peeps do

  before(:each) do
    Users.create("test name", "test user name", "test@email.com", "testpassword")
  end

  describe '#all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      Peeps.create("Peep test one", 1)
      Peeps.create("Peep test two", 1)
      Peeps.create("Peep test three", 1)

      peeps = Peeps.all

      expect(peeps.length).to eq 3
      expect(peeps[0].peep).to eq 'Peep test one'
    end
  end

  describe '#create' do
    it 'creates the peep' do
      Peeps.create('Test peep', 1)
      peep = Peeps.all
      expect(peep[0].peep).to eq 'Test peep'
    end
  end

  describe '#create' do
    it 'creates a timestamp for a peep' do
      allow(Peeps).to receive(:created_time).and_return "September 1, 2018 at 12:11 PM"
      Peeps.create('Test peep', 1)
      peep = Peeps.all
      expect(peep[0].created_at).to eq "September 1, 2018 at 12:11 PM"
    end
  end

  describe '#create' do
    it 'includes .User name and user name' do
      allow(Peeps).to receive(:created_time).and_return "September 1, 2018 at 12:11 PM"
      Peeps.create('Test peep', 1)
      peep = Peeps.all
      expect(peep[0].name).to eq "test name"
      expect(peep[0].user_name).to eq "test user name"
    end
  end
end
