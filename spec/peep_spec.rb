require './lib/peep.rb'

describe Peep do
  context '.create' do
    it 'creates a new peep' do
      peep = Peep.new("Name", "Content")
      peep.create
      expect(peep.peeps_list).to include({ name: "Name", content: "Content"})
    end
  end

  context '.all' do
    it 'displays all peeps' do
      pending()
      expect{ Peep.all }.to satisfy{ |result| result.any { |peep|
        peep.instance_of? Peep } }
    end
  end
end
