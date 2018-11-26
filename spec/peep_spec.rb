require 'peep'


describe Peep do

  describe '.write' do
    it 'creates a new peep' do

      connection = PG.connect(dbname: 'chitter_test')

      user = User.create(email: 'test@example.com', password: 'password123', name: 'testone', username: 'zorro')
      peep = Peep.write(user_id: user.id, mytime: '06/06/1983', text: 'This is a test peep')
      expect(peep).to be_a Peep
      expect(peep.text).to eq 'This is a test peep'
      expect(peep.mytime).to eq '1983-06-06 00:00:00'
      expect(peep.user_id).to eq user.id
    end
  end

  describe '.where' do
    it 'gets the relevant peep from the databse' do
      connection = PG.connect(dbname: 'chitter_test')
      user = User.create(email: 'test@example.com', password: 'password123', name: 'testone de testini', username: 'zorro')
      peep = Peep.write(user_id: user.id, mytime: '06/06/1983', text: 'This is a test peep')
      peeps = Peep.where(user_id: user.id)
      expect(peep.text).to eq 'This is a test peep'
      expect(peep.mytime).to eq '1983-06-06 00:00:00'
      expect(peep.user_id).to eq user.id
    end
  end
end
