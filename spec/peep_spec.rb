require 'peep'
require 'database_helpers'

describe '.all' do
 it 'returns a list of peeps' do
   connection = PG.connect(dbname: 'chitter_test')

   # Add the test data
   peep = Peep.create(peep: "Wassup world")
   Peep.create(peep: "Great weather today")
   Peep.create(peep: "Feeling so tired")

   peeps = Peep.all

   expect(peeps.length).to eq 3
   expect(peeps.first).to be_a Peep
   expect(peeps.first.id).to eq peep.id
   expect(peeps.first.peep).to eq 'Wassup world'
  end
end

describe '.create' do
  it 'creates a new peep' do
    peep = Peep.create(peep: 'Best time at the party last night')
    persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep.id};")

    expect(peep).to be_a Peep
    expect(peep.id).to eq persisted_data.first['id']
    expect(peep.peep).to eq 'Best time at the party last night'
  end
end
