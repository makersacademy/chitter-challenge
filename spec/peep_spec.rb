require './lib/peep.rb'

describe Peep do
  let(:peep) { Peep.new("Name", "Some content") }
  context '.new' do
      it 'creates a new message with a name' do
        expect(peep.name).to eq("Name")
      end

      it 'creates a new message with content' do
        expect(peep.content).to eq("Some content")
      end
    end

  context '.create' do
    it 'creates a new peep' do
      peep = Peep.new("Name", "Some content")
      peep.create
      peeps = Peep.all

      expect(peeps).to satisfy{ |result| result.any? { |peep|
        peep.name == "Name" && peep.content == "Some content" }
       }
    end
  end

  context '.all' do
    it 'displays all peeps' do
      expect(Peep.all).to satisfy{ |result| result.any? { |peep|
        peep.instance_of? Peep } }
    end
  end
end
