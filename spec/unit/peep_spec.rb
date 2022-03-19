require './app/models/peep'

describe Peep do

  context '#all' do
    it 'returns all the posts' do
      Peep.create(content: 'This is my first Chitter Post.')
      Peep.create(content: 'Sunny today eh?')

      peeps = Peep.all
      expect(peeps.first).to eq 'This is my first Chitter Post.'
    end
  end

  context '#create' do
    it 'creates a new post' do
      peep = Peep.create(content: 'This is my first Chitter Post.')
      expect(Peep.all).to include 'This is my first Chitter Post.'
    end
  end
end