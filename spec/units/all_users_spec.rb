require 'all_users'
require 'bcrypt'

RSpec.describe AllChitterUsers do

  let(:fake_connection) do
    double :DatabaseConnection,
    query: [{ name: 'Billy', email: 'billy@mail.com',
                    username: 'billy1', password: 'password' }]
  end
  let(:fake_hasher) do
    double :FakeCrypt,
    create: 'password',
    new: BCrypt::Password.create('password')
  end

  subject do
    described_class.new(connection: fake_connection, hasher: fake_hasher)
  end

  it 'should be able to create a new user' do
    borace_hash = { name: 'Borace', email: 'borace@mail.co.uk',
                    username: 'borace01', password: 'password' }
    borace_sql = 'INSERT INTO users(name, username, email, password)'\
      " VALUES('#{borace_hash[:name]}', '#{borace_hash[:username]}', "\
      "'#{borace_hash[:email]}', '#{borace_hash[:password]}');"
    expect(fake_connection).to receive(:query)

    subject.create(borace_hash)
  end

  it 'should reject already used usernames' do
    billy_hash = { name: 'Billy', email: 'billy@mail.com',
                    username: 'billy02', password: 'password' }
    expect(subject.create(billy_hash)).to eq 'in use'
  end

  it 'should reject already used emails' do
    billy_hash = { name: 'Billy', email: 'billy2@mail.com',
                    username: 'billy01', password: 'password' }
    expect(subject.create(billy_hash)).to eq 'in use'
  end

  it 'should be able to return all user records' do
    sql = 'SELECT name, username, email, password FROM users;'
    expect(fake_connection).to receive(:query).with(sql)

    subject.all
  end

  it 'should sign in a user if given valid credentials' do
    expect(subject.sign_in('billy1', 'password')).to eq true
  end

  it 'should not sign in a user if given invalid credentials' do
    expect(subject.sign_in('billy2', 'password2')).to eq false
  end
end
