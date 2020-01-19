require 'peeps'
require 'setup_test_database'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      peep = Peeps.post(message: 'This is a peep!')
      Peeps.post(message: 'This is another peep!')
      Peeps.post(message: 'Yet another peep!')

      peeps = Peeps.all

      expect(peeps.length).to eq 3
      expect(peeps.first.time).to eq Time.now.strftime("%k:%M")
    end
  end

  describe '.post' do
    it 'creates a peep' do
      peep = Peeps.post(message: 'This is a peep!')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peeps
      expect(peep.id).to eq persisted_data['id']
      expect(peep.message).to eq 'This is a peep!'
    end
  end
end
