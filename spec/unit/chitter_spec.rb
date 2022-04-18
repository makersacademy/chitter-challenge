require 'chitter'
require 'database_helpers'


describe Chitter do
   it 'return all the peeps' do
    current_timestamp = Time.now
    DatabaseConnection.query("INSERT INTO peeps (peep, time) VALUES($1, $2);", ['how are you?', current_timestamp ])
    DatabaseConnection.query("INSERT INTO peeps (peep, time) VALUES($1, $2);", ['Let us discuss', current_timestamp ])
    peeps = Chitter.all
    expect(peeps.first.peep).to include "how are you?" 
    # expect(peeps[1]).to eq "Let us discuss"
  end
  context 'adding a new peep' do
    it 'lets a user to post a new peep on chitter' do
      Chitter.create(peep: 'Hello')
      peep = Chitter.all
      expect(peep.first.peep).to include 'Hello'
    end
  end 
  # in spec/user_spec.rb
require 'database_helpers'

  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'test@example.com', password: 'password123')

      persisted_data = persisted_data(table: :users, id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'test@example.com'
    end
  end
end
