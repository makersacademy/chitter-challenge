require './lib/user'

describe User do

  it 'expects users to respond to method .all' do
    expect(User).to respond_to { all }
  end
  
  describe '#create' do
    it 'creates a new user' do
      users = User.create(username: 'Sujee', email: 'supaman@gmail.com', password: 'iamsupaman')
    #   persisted_data = persistant_data(id: users.id, table: 'users')
      users = User.all
    #   expect(users.length).to eq 1
    #   expect(users.first).to be_a User
    #   expect(users.id).to eq users.id
    #   expect(users.username).to eq 'Sujee'
    #   expect(users.email).to eq 'supaman@gmail.com'
    #   expect(users.password).to eq 'iamsupaman'
    end
  end
end
