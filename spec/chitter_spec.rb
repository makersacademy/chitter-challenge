require 'chitter'

describe Chitter do
  let(:new_peep) { double(:peep, peep: 'test peep', username: 'TestUser', post_time: '00:00') }

  describe '#add' do
    it 'adds a new peep' do
      Chitter.add_peep(peep: new_peep)
      expect(Chitter.log.first.peep).to eq 'test peep'
      expect(Chitter.log.first.username).to eq 'TestUser'
    end
  end

end
