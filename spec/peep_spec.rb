require 'peep'

describe Peep do

  describe '.create' do
    it 'creates a new peep' do
      user = double(
        name: 'Test User',
        email: 'test@email.com',
        username: 'test username',
        password: 'password123'
      )

      persisted_user_data = persist_user_data(name: user.name, username: user.username, email: user.email, password: user.password)

      user_id = persisted_user_data['id']

      peep = Peep.create(text: 'This is a test peep', user_id: user_id)

      persisted_data = persisted_data(table: 'peeps', id: peep.id )

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.text).to eq 'This is a test peep'
      expect(peep.user_id).to eq user_id
      expect(peep.tstz).to eq persisted_data['tstz']
    end
  end

  describe '.all' do
    it 'returns all the peeps' do
      user = double(
        name: 'Test User',
        email: 'test@email.com',
        username: 'test username',
        password: 'password123'
      )

      persisted_user_data = persist_user_data(name: user.name, username: user.username, email: user.email, password: user.password)

      user_id = persisted_user_data['id']

      peep = Peep.create(text: 'This is a test peep', user_id: user_id)

      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep.id}")
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.text).to eq persisted_data.first['text']
      expect(peep.user_id).to eq persisted_data.first['user_id']
    end
  end

end
