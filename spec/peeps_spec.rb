require 'peeps'
require 'database_helpers'

describe Peeps do

  it 'stores in the database a new peep' do
    Peeps.add("why hello there")

    messages = Peeps.all
    
    messages.each do |peep|
      expect(peep.peep).to include "why hello there"
    end
  end

  it 'creates a new peep' do
    peep = Peeps.add('new test peep')
    persisted_data = persisted_data(table: 'peeps', id: peep.id)

    expect(peep).to be_a Peeps
    expect(peep.id).to eq persisted_data.first['id']
    expect(peep.peep).to eq 'new test peep'
  end
  
end
