require 'chitter'


describe Chitter do
   it 'return all the peeps' do
    current_timestamp = Time.now
    DatabaseConnection.query("INSERT INTO peeps (peep, time) VALUES($1, $2);", ['how are you?', current_timestamp ])
    DatabaseConnection.query("INSERT INTO peeps (peep, time) VALUES($1, $2);", ['Let us discuss', current_timestamp ])
    peeps = Chitter.all
    expect(peeps[0]).to include "how are you?" 
    expect(peeps[1]).to eq "Let us discuss"
  end
  context 'adding a new peep' do
    it 'lets a user to post a new peep on chitter' do
      peep = Chitter.create(peep: 'Hello')
      expect(Chitter.all).to include 'Hello'
    end
  end 

end
