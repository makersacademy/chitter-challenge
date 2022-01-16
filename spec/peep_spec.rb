require 'peep'

describe Peep do
  describe '#create' do
    let(:message) { 'peep peep' }
    let(:user) { 'Pingu' }
    let(:time) { "2022-01-16 18:29:35" }
 
    it 'lets peeps be made and read' do
      peep = Peep.create(message: message, user: user, time: time)
      peeps = Peep.all

      expect(peeps.first.message).to eq 'peep peep'
    end

    it 'peeps are read in reverse order' do
      Peep.create(message: 'one', user: user, time: time)
      Peep.create(message: 'two', user: user, time: time)
      Peep.create(message: 'three', user: user, time: time)

      peeps = Peep.all

      expect(peeps.first.message).to eq 'three'
      # add the others?
    end

    it 'records the time a peep is posted and a displays it with the peep' do
      peep = Peep.create(message: message, user: user, time: time)
      peeps = Peep.all
      expect(peeps.first.time).to include time

    end

  end
end