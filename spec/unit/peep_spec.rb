require 'peep'

describe Peep do

  before(:each) do
    User.create('Ed', 'Ed209', 'password1', 'ed@genericemail.com')
  end

  describe '.add' do

    it 'adds a peep to the peep feed' do
      expect { Peep.add('This is a peep') }.to change { Peep.feed.length }.from(0).to(1)
    end

    it 'will not add a blank peep' do
      expect { Peep.add('') }.not_to change { Peep.feed.length }
    end
  end

  describe '.feed' do

    it 'joins users/peeps databases to create array of peep objects' do
      Peep.add('This is a peep', '17:00:00')
      
      peep = Peep.feed.first
      
      expect(peep.handle).to eq '@Ed209'
      expect(peep.content).to eq 'This is a peep'
      expect(peep.time).to eq '17:00'
    end

    it 'sorts array of peeps into reverse chronological order based on time and date' do
      Peep.add('This should be the last peep', '12:30:00', '2021-08-22')
      Peep.add('This should be the first peep', '16:00:00', '2021-08-23')
      Peep.add('This should be the middle peep', '18:30:00', '2021-08-22')

      peeps = Peep.feed

      expect(peeps.length).to eq 3
      expect(peeps.first.content).to eq 'This should be the first peep'
      expect(peeps.first.handle).to eq '@Ed209'
      expect(peeps.first.time).to eq '16:00'
      expect(peeps[1].date).to eq 'Sun 22 Aug 2021'
      expect(peeps[1].content).to eq 'This should be the middle peep'
      expect(peeps.last.content).to eq 'This should be the last peep'
      expect(peeps.last.time).to eq '12:30'
    end
  end
end
