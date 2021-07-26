require 'peep'

describe Peep do
  it 'creates and saves a new peep' do
    peep = Peep.create(name: 'Tom', content: "Peeper!")
    expect(peep).to be_a Peep
    expect(peep.id).to eq PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep.id};").first['id']
    expect(peep.name).to eq 'Tom'
    expect(peep.content).to eq "Peeper!"
  end
end
