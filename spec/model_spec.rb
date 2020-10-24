require 'model.rb'
require 'database_helper'

describe '.all' do
  it 'returns peeps on the table' do
    connection = PG.connect(dbname: 'chitter_test')
    
    peep = connection.exec("INSERT INTO chitter_peeps (peeps) VALUES ('My second try peep');")

    peeps = Peep.all

    expect(peeps.length).to eq 1
    expect(peeps.first.peeps).to eq 'My second try peep'
  end
end

describe '.create' do
  it 'creates a new peep' do
    new_peep =  Peep.create(peeps: 'testing new peep')
    persisted_data = persisted_data(id: new_peep.id)
    # persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM chitter_peeps WHERE id = #{new_peep.id};")
    
    
    expect(new_peep.peeps).to eq 'testing new peep'

  end 
end 




