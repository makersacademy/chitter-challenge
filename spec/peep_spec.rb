require 'peep'
require 'time'
require 'database_helpers'

describe Peep do
  describe '.create' do
    it "adds Peep to database" do

      dummy_user = DatabaseConnection.query("INSERT INTO users (name, user_name, email, password) VALUES ('Dummy User', 'DummyUsername', 'dummyemail@domain.com', 123456789) RETURNING id, name, user_name, email, password;")

      peep = Peep.create(userid: dummy_user[0]['id'], timestamp: Time.now, content: 'Is anyone there?', threadpeep: 'Is anyone there?')

      persisted_data = persisted_data(table: 'peeps', id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(DateTime.parse(peep.timestamp)).to be_an_instance_of DateTime
      expect(peep.content).to eq 'Is anyone there?'
    end
  end

  describe '.all' do
    it 'returns a list of peeps' do
      dummy_user = DatabaseConnection.query("INSERT INTO users (name, user_name, email, password) VALUES ('Dummy User', 'DummyUsername', 'dummyemail@domain.com', 123456789) RETURNING id, name, user_name, email, password;")

      peep = Peep.create(userid: dummy_user[0]['id'], timestamp: Time.now, content: 'Is anyone there?', threadpeep: 'Is anyone there?')
      Peep.create(userid: dummy_user[0]['id'], timestamp: Time.now, content: 'Get me out of here!', threadpeep: 'Get me out of here!')
      Peep.create(userid: dummy_user[0]['id'], timestamp: Time.now, content: 'The time has come', threadpeep: 'The time has come')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.content).to eq 'Is anyone there?'
    end
  end
end
