require 'database_helpers'
require 'user'

describe '.create' do
  it 'creates a new user' do
    expect(BCrypt::Password).to receive(:create).with('test234') 
    user = User.create(name: 'Test', username: 'TestUN', email: 'test@email.com', password: 'test234')
    persisted_data = persisted_data(table: :users, id: user.id)
   
    
    expect(user).to be_a User
    expect(user.id).to eq persisted_data['id']
    expect(user.name).to eq 'Test'
    expect(user.username).to eq 'TestUN'
    expect(user.email).to eq 'test@email.com'
  end
end

describe '.find' do
  it 'can find a user by their id' do
    user = User.create(name: 'Test', username: 'TestUN', email: 'test@email.com', password: 'test234')
    result = User.find(id: user.id)
    expect(result).to be_a User
    expect(result.id).to eq user.id
    expect(result.name).to eq user.name
    expect(result.username).to eq user.username
    expect(result.email).to eq user.email
  end
  it "won't find user if id is nill" do
    result = User.find(id: nil)
    expect(result).to be nil
  end
end
