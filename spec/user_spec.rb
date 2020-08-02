require_relative './spec_helper'
require_relative '../models/user'

describe '#create' do

  let(:user) {  User.create(name: 'test', email: 'test@test.com', password: 'password123') }

  it 'creates a new user' do
    user
    db_data = db_data(table: 'users', id: '1')
    expect(user.name).to eq db_data.first['name']
    expect(User.create(name: 'test2', email: 'test2@test.com', password: 'password123').id).to eq '2'
  end

  it 'hashes password via Bcrypt' do
    expect(BCrypt::Password).to receive(:create).with('password123')
    user
  end

end

describe '#find' do

  let(:user) {  User.create(name: 'test', email: 'test@test.com', password: 'password123') }

  it 'finds a user' do
    user
    result = User.find(id: user.id)
    expect(user.id).to eq result.id
    expect(user.name).to eq result.name
  end

  it 'returns nil if there is no ID given' do
    expect(User.find(id: nil)).to eq nil
  end

end
