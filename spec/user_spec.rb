require 'user'

describe User do
  it 'creates a new user' do
    user = User.create(name: "Ruby", username: "rb", email: 'test@ruby.com', password: 'password')

    expect(user).to be_a User
    expect(user.name).to eq "Ruby"
    expect(user.username).to eq "@rb"
    expect(user.email).to eq 'test@ruby.com'
  end

  context "authenticate"
    it 'sign in a user with the right credentials' do
      user = User.create(name: "Ruby", username: "rb", email: 'test@ruby.com', password: 'password')
      authenticated_user = User.authenticate(email: 'test@ruby.com', password: 'password')
      expect(user.id).to eq authenticated_user.id
      expect(user.name).to eq authenticated_user.name
    end

    it 'return nil given the wrong email' do
      user = User.create(name: "Ruby", username: "rb", email: 'test@ruby.com', password: 'password')
      result = User.authenticate(email: 'wrong@email.com', password: 'password')
      expect(result).to eq nil
    end

    it 'return nil given the wrong password' do
      user = User.create(name: "Ruby", username: "rb", email: 'test@ruby.com', password: 'password')
      result = User.authenticate(email: 'test@ruby.com', password: 'wrongpassword')
      expect(result).to eq nil
    end

end