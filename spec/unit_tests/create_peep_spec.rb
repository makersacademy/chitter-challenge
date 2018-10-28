require 'peep'

describe 'Create peep' do

  it 'creates a peep with given details' do
    user = User.sign_up(name: 'any', email: 'any', username: 'any', password: 'any')

    peep = Peep.create(text: 'a peep', user_id: user.id)

    expect(peep.id).to be > 0
    expect(peep.user_id).to eq user.id
    expect(peep.text).to eq 'a peep'
    expect(peep.timestamp).not_to be_nil
  end

  it 'persits a user with given details' do
    user = User.sign_up(name: 'any', email: 'any', username: 'any', password: 'any')
    peep = Peep.create(text: 'a peep', user_id: user.id)

    result = PG.connect(dbname: 'chitter_test').exec('SELECT * FROM peeps')

    expect(result.count).to eq 1
    expect(result[0]["id"].to_i).to eq peep.id
    expect(result[0]["user_id"].to_i).to eq user.id
    expect(result[0]["text"]).to eq 'a peep'
    expect(Time.parse(result[0]["timestamp"]).to_s).to eq peep.timestamp.to_s
  end

end
