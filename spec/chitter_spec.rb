require 'peep'
require_relative './features/database_helpers'

describe Peep do

  it '.all lets you see all the previous peeps' do
    DatabaseConnection.query("INSERT INTO chitter (peep) VALUES('testing...');")
    DatabaseConnection.query("INSERT INTO chitter (peep) VALUES('testing!');")
    DatabaseConnection.query("INSERT INTO chitter (peep) VALUES('1, 2, 3!');")

    peeps = Peep.all.map { |peep| peep.peep }

    expect(peeps).to include 'testing...'
    expect(peeps).to include 'testing!'
    expect(peeps).to include '1, 2, 3!'
  end

  it '.peep posts a peep to the database' do
    new_peep = Peep.peep(peep: 'Testing... testing! 1, 2, 3!')
    persisted_data = persisted_data(id: new_peep.id)
    expect(new_peep).to be_a Peep
    expect(new_peep.id).to eq persisted_data['id']
    expect(new_peep.peep).to eq 'Testing... testing! 1, 2, 3!'
  end
end
