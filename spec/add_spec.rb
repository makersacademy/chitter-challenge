require 'model.rb'

describe '.add' do
  it 'returns last added peep' do
    connection = PG.connect(dbname: 'chitter')
    

    peeps = Peep.add

    expect(peeps).to include "My first second try peep"
  end
end