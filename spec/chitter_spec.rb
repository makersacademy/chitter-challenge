describe Peeps do
  describe '.all' do
    it 'returns array of all tweets' do
      Peeps.add('Hello Chitter!')
      # Make sure it returns a msg and timestamp
      expect(Peeps.all[0].keys).to contain_exactly(:msg, :created_at)
      # Make sure the message is correct
      expect(Peeps.all[0][:msg]). to eq('Hello Chitter!')
      # Make sure timestamp isn't empty
      expect(Peeps.all[0][:created_at]).to_not be_empty
    end
  end

  describe '.add' do
    it 'adds a peep to the DB' do
      expect { Peeps.add('Hello Chitter!') }.to_not raise_error
    end
  end
end