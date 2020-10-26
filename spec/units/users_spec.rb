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
end
