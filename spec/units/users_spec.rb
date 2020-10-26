require './lib/users'
require 'database_helper'

describe Users do
  describe '#.sign_up' do
    it 'signs up a new user to chitter' do
      new_user = Users.sign_up(username: 'harrypotter', email: 'harrypotter@gmail.com', password: 'ilovetomriddle123')
      persisted_data = persisted_data(id: new_user.id, table: :users)

      expect(new_user).to be_a Users
      expect(new_user.id).to eq persisted_data['id']
      expect(new_user.username).to eq 'harrypotter'
      expect(new_user.email).to eq 'harrypotter@gmail.com'
    end
  end

  describe '#.logged_in' do
    it 'can check that a user is logged in' do
      user = Users.sign_up(username: 'Hermione_Granger', email: 'hgranger@wizardworld.com', password: 'iloveronron')
      result = Users.logged_in(id: user.id)
  
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
  end

  describe '#.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = Users.sign_up(username: 'Fred', email: 'fredw@wizardwonders.com', password: 'password123')
      authenticated_user = Users.authenticate(email: 'fredw@wizardwonders.com', password: 'password123')
      persisted_data = persisted_data(id: user.id, table: :users)

      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect email address' do
      user = Users.sign_up(username: 'dasha123', email: 'test@example.com', password: 'password123')
  
      expect(Users.authenticate(email: 'nottherightemail@me.com', password: 'password123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      user = Users.sign_up(username: 'dasha123', email: 'test@example.com', password: 'password123')
  
      expect(Users.authenticate(email: 'test@example.com', password: 'password12345')).to be_nil
    end
  end
end
