require 'user'

describe User do
  let(:new_user) { User.new(1, 'Lou', 'loushark', 'loushark@gmail.com', 'Sharks@reC00l')}

  it 'initializes a user with user information(name, username, email, password)' do
    expect(new_user.name).to eq 'Lou'
    expect(new_user.username).to eq 'loushark'
    # expect(new_user.email).to eq 'loushark@gmail.com'
    # expect(new_user.password).to eq 'Sharks@reC00l'
  end

  describe '.add' do
    it 'creates a new user' do
	    user = User.add(new_user.name, new_user.username, 'email', 'password')
	    persisted_data = persisted_data_users(id: user.id)

	    expect(user).to be_a User
	    expect(user.id).to eq persisted_data['id']
	    expect(user.name).to eq 'Lou'
      expect(user.username).to eq 'loushark'
      # expect(user.email).to eq 'loushark@gmail.com'
      # expect(user.password).to eq 'Sharks@reC00l'
    end
  end

  # describe 'loggedin_username' do
  #   it 'returns a username' do
  #     expect(User.loggedin_username(new_user.username)).to eq 'loushark'
  #   end
  # end
end
