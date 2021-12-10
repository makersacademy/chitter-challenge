require 'peep'

describe Peep do
  context '#initialize' do
    it 'inflates database information into instances of the Peep class' do
      peep = Peep.new(name: 'Birdy', username: 'fly_away', time: '1999-01-08 04:05:06', content: 'Oh hey chitter!', tagged_users: 'Croc')

      expect(peep.name).to eq 'Birdy'
      expect(peep.username).to eq 'fly_away'
      expect(peep.time).to eq '1999-01-08 04:05:06'
      expect(peep.content).to eq 'Oh hey chitter!'
      expect(peep.tagged_users).to eq 'Croc'
    end
  end
end
