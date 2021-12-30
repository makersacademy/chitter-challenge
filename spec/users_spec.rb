require 'user'

describe '.create' do
  it 'creates a new user' do
    connection = PG.connect(dbname: 'chitter_test')
    user = User.create(username: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')
   
    # expect(user).to be_a User
    # expect(user.id).to eq(persisted_data['id'])
    expect(user.username).to eq('Hagrid')
    expect(user.email).to eq('hagrid@gmail.com')
    expect(user.password).to eq('hagrid123')
  end
end