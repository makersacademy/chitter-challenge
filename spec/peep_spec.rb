require 'pg'
require 'peep'

describe Peep do
  context 'add new peep' do
    it 'creates a new peep' do
      peep = Peep.create("This is my first peep.", "ellieSMASH", "Ellie")
      expect(peep).to be_a(Peep)
    end

    it 'adds peep to the database' do
      Peep.create("This is my first peep.", "ellieSMASH", "Ellie")
      peeps = Peep.all
      expect(peeps.length).to eq(1)
    end

  end
end
