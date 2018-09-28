require 'users'

RSpec.describe Users do

 let(:fake_connection) { double :DatabaseConnection, query: nil }

  subject { described_class.new(connection: fake_connection) }

  it 'should be able to create a new user' do

  end

  it 'should be able to return all user records' do
    sql = 'SELECT name, username, email, password FROM users;'
    expect(fake_connection).to receive(:query).with(sql)

    subject.all
  end

  it 'should be able to update user records' do

  end

  it 'should be able to delete user records' do

  end

end
