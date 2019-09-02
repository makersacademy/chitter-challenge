require 'bcrypt'
require 'peep'

describe Peep do
  it 'creates a peep' do
    allow(Time).to receive(:now).and_return('2019-01-01 00:00:00')
    peep = Peep.create('My first peep', 1)
    expect(peep.id).to eq('1')
    expect(peep.content).to eq('My first peep')
    expect(peep.peep_time).to eq('2019-01-01 00:00:00+00')
    expect(peep.user_id).to eq('1')
  end
  it 'returns all peeps' do
    encrypted_password = BCrypt::Password.create('password1234')
    sql = %q{INSERT INTO users (email, password) VALUES ($1, $2) RETURNING id, email;}
    DatabaseConnection.query(sql, [Mail::Address.new('me@example.com').address, encrypted_password])
    Peep.create('My first peep!', '1')
    Peep.create('Hello', '1')
    Peep.create('World', '1')

    peeps = Peep.all
    expect(peeps).to all(be_a(Peep))
    expect(peeps.count).to eq(3)
  end
  it 'returns all peeps by a specific user' do
    encrypted_password = BCrypt::Password.create('password1234')
    sql = %q{INSERT INTO users (email, password) VALUES ($1, $2) RETURNING id, email;}
    DatabaseConnection.query(sql, [Mail::Address.new('me@example.com').address, encrypted_password])
    Peep.create('My first peep!', '1')
    Peep.create('Hello', '2')
    Peep.create('World', '2')

    peeps = Peep.find_user(2)
    expect(peeps).to all(be_a(Peep))
    expect(peeps.count).to eq(2)
    expect(peeps[0].user_id).to eq('2')
    expect(peeps[1].user_id).to eq('2')
  end
end
