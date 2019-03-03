require 'peep'
require 'pg'
require 'database_helpers'

describe 'Peep' do

  it 'allows user to create a peep' do
    peep = Peep.create(peep: "test for creating peep", time: Time.new(2000))
    persisted_data =persisted_data(id: peep.id)
    # persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps1 WHERE id = #{{peep.id}};")
    # Peep.create(peep: "Second test for creating peep", time: Time.new(2003))

    # peeps = Peep.all

    expect(peep).to be_a Peep
    expect(peep.id).to eq persisted_data.first['id']
    expect(peep.peep).to eq "test for creating peep"
    # expect(peeps.length).to eq 2
    # expect(peeps.first).to be_a Peep
    # expect(peeps.first.id).to eq bookmark.first['id']
    # expect(peeps.first.peep).to eq 'test for creating peep'
    # expect(Peep.all).to include 'test for creating peep'
    # # expect(new_peep).to eq "test peep"
  end

  it 'returns all peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    peep = Peep.create(peep: "test peep for all method", time: Time.new(2000))
    Peep.create(peep: "second test peep for all method", time: Time.new(2003))

    # peeps = Peep.all
    peeps = Peep.all

    # persisted_data =persisted_data(id: peep.id)

    expect(peeps.length).to eq 2
    expect(peeps.first).to be_a Peep
    expect(peeps.first.id).to eq peep.id
    expect(peeps.first.peep).to eq "test peep for all method"
    # peeps = Peep.all
    # connection.exec("INSERT INTO peeps1 (peep) VALUES('Test peep from database');")
    # connection.exec("INSERT INTO peeps1 (peep) VALUES('Second test peep from database');")

  #   peeps = Peep.all
  #
  #   expect(peeps).to include('Test peep from database')
  #   expect(peeps).to include('Second test peep from database')
  # end
    end
end
