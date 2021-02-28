require 'peeps'
require 'Time'
require_relative './database_helpers.rb'

describe 'Peep' do

  context '.create' do
    it 'creates a peep' do
      Peep.create(peep: 'first', username: 'king_of_universe', timestamp: Time.local(-2280).to_i)
      peeps = Peep.all.first
      expect(peeps).to be_a Peep
      expect(peeps.peep).to eq "first"
      expect(peeps.username).to eq 'king_of_universe'
    end
  end

  context '.all' do
    it 'returns all of the peeps in the database in reverse order' do
      # Peep.create(peep: 'first', username: 'king_of_universe', timestamp: Time.local(-2280).to_i)
      # Peep.create(peep: "got to do the stupid festival today #CantBeAsked", username: 'sargons_bff', timestamp: Time.local(-550).to_i)
      # Peep.create(peep: "Guys i just found this totally sick temple come check it out", username: 'sargons_bff', timestamp: Time.local(-540).to_i)
      # Peep.create(peep: "@sargons_bff mine", username: 'the_golden_C', timestamp: Time.local(-539).to_i)
      add_to_database()

      peeps = Peep.all

      expect(peeps.length).to eq 4
      expect(peeps.first).to be_a Peep
      expect(peeps.first.peep).to eq "@sargons_bff mine"
      expect(peeps.first.username).to eq 'the_golden_C'
      expect(peeps.first.timestamp).to eq Time.local(-539).to_i
    end
  end

end