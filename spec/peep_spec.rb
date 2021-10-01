require 'peep'

describe Peep do
  it 'creates and saves a new peep' do
    peep = Peep.create(content: 'Peeper!', user_id: 1)
    expect(peep).to be_a Peep
    expect(peep.id).to eq PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep.id};").first['id']
    expect(peep.content).to eq 'Peeper!'
    expect(peep.created_at).to eq PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE created_at = '#{peep.created_at}';").first['created_at']
    expect(peep.user_id).to eq "1"
  end
end
