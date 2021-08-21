require 'peep'

describe Peep do

  before(:each) do
    User.create('Ed', 'Ed209', 'password1', 'ed@genericemail.com')
  end

  describe '.all' do
    it 'returns all peeps' do
      Peep.add('Having breakfast', '07:30:00')
      Peep.add('Having lunch', '12:30:00')
      Peep.add('Having dinner', '18:00:00')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first.content).to eq 'Having breakfast'
      expect(peeps.last.time).to eq '18:00:00'
    end

  end

  describe '.add' do

    it 'adds a peep to the database as a peep object' do
      peep = Peep.add('This is a peep')
      expect(peep).to be_a(Peep)
      expect(peep.content).to eq 'This is a peep'
    end
  end

  describe '.feed' do

    it 'joins users/peeps databases to create array of strings for chitter feed' do
      peep = Peep.add('This is a peep')
      expect(Peep.feed).to include '@Ed209: This is a peep'
    end
  
  end

end
