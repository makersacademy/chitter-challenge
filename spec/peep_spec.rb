require 'peep'

describe Peep do
  describe '.create' do
    it 'create a peep in the database and return an instance of Peep' do
      user = User.create(name: 'Umberto', username: 'uValente', email: 'mock@gmail.com', password: 'psw123')
      peep = Peep.create(user_id: user.id, content: 'I am the peep!')
      database_peep = PG.connect(dbname: 'chitter_test').exec("SELECT * FROM peeps WHERE id='#{peep.id}';")

      expect(peep.id).to eq database_peep[0]['id']
      expect(peep.content).to eq 'I am the peep!'
      expect(peep.user_id).to eq user.id
      expect(peep.created_on).to eq database_peep[0]['created_on']
    end
  end
end
