require './lib/user.rb'

describe '.create' do
  it 'creates a new user' do
    user = User.create("Tom", "tom@gmail.com", "TomChitter", "tom2000")
    expect(user.name).to eq 'Tom'
    expect(user.email).to eq 'tom@gmail.com'
    expect(user.username).to eq 'TomChitter'
    expect(user.password).to eq 'tom2000'
  end
end