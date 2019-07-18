require './models/user'

describe User do

  describe '#.all' do
    it 'returns all users' do
    
    connection = PG.connect(dbname: 'peep_manager_test')
    connection.exec("INSERT INTO users (username, name) VALUES('richie', 'richieganney');")
    users = User.all
    expect(users).to include 'richie'
    end
  end
end

