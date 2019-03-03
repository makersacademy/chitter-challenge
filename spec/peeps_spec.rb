require 'peep'
require 'database_helpers'
require 'database_connection'
require 'user'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      user = User.create(name: 'Simona', email: 'simona.gioe88@gmail.com', username: 'Airies', password: 'Password123')

      peep = Peep.create(text: "First peep text test", posted_time: (Time.now).strftime("%d/%m/%Y %H:%M"), user_id: user.id)
      Peep.create(text: "Second peep text test", posted_time: (Time.now).strftime("%d/%m/%Y %H:%M"), user_id: user.id)
      Peep.create(text: "Third peep text test", posted_time: (Time.now).strftime("%d/%m/%Y %H:%M"), user_id: user.id)

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.text).to eq 'First peep text test'
      expect(peeps.first.posted_time).to eq peep.posted_time
      expect(peeps.first.user_id).to eq user.id
    end
  end

  describe '.create' do
    it 'create a new peep' do

      user = User.create(name: 'Simona', email: 'simona.gioe88@gmail.com', username: 'Airies', password: 'Password123')

      peep = Peep.create(text: "First peep text test", posted_time: (Time.now).strftime("%d/%m/%Y %H:%M"), user_id: user.id)
      persisted_data = persisted_data(table: 'peeps', id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.text).to eq "First peep text test"
      expect(peep.user_id).to eq user.id
    end
  end

end
