require 'peep'
require 'database_helper'

describe Peep do
  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(message: "Test Peep")
      connection = PG.connect(dbname: 'chitter_test')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.message).to eq "Test Peep"
    end

    # it 'does not create a new peep if it is above 140 characters' do
    #   peep = Peep.create(message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque interdum rutrum sodales. Nullam mattis fermentum libero, non 
    #   ")
    #   connection = PG.connect(dbname: 'chitter_test')
    #   expect(Peep.all).not_to include("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque interdum rutrum sodales. Nullam mattis fermentum libero, non
    #   ")
    # end
  end

  describe '.all' do
    it 'shows all the stored peeps' do
      peep = Peep.create(message: "Covfefe")
      Peep.create(message: "Ed Balls")
      peeps = Peep.all

      expect(peep).to be_a Peep
      expect(peeps.length).to eq 2
      expect(peeps.last.message).to eq('Covfefe')
    end

    it 'shows stored peeps in chronological order' do
      peep1 = Peep.create(message: "Covfefe")
      peep2 = Peep.create(message: "Ed Balls")
      peep3 = Peep.create(message: "Hello!")
      peeps = Peep.all
      result = peeps.each { |peep| peep.message}

      expect(peeps.first.id).to eq peep3.id
      expect(peeps.first.message).to eq "Hello!"
    end

  end

end