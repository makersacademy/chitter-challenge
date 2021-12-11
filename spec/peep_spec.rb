require 'peep'

describe 'Peep' do
  describe '.all' do
    it "returns all the Peeps" do

      Peep.create(content: 'My first Peep')
      Peep.create(content: 'My second Peep')
      Peep.create(content: 'My third Peep')

      peeps = Peep.all

      expect(peeps).to include('My first Peep')
      expect(peeps).to include('My second Peep')
      expect(peeps).to include('My third Peep')
    end
  end

  describe '.create' do
    it 'creates a Peep' do
      Peep.create(content: 'My fourth Peep')
      expect(Peep.all).to include('My fourth Peep')
    end
  end
end