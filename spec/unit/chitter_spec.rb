require 'chitter'
require 'user'
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
  it 'returns nil given an incorrect password' do
    user = User.create(email: 'test@example.com', password: 'password123')

    expect(User.authenticate(email: 'test@example.com', password: 'wrongpassword')).to be_nil
  end
end
