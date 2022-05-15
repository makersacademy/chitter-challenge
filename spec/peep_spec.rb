require 'peep'

describe Peep do

  describe '#.show' do

    it 'shows messages from database in reverse chronological order' do

      Peep.post('First')
      peep = Peep.post('Second')
      peeps = Peep.show
      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq 'Second'
      expect(peeps.first.time).to eq peep.time

    end

  end

  describe '#.post' do

    it 'inserts a message in the database' do

      Peep.post('Message 1')
      peep = Peep.post('Message 2')

      data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep.id};")
      expect(peep).to be_a Peep
      expect(peep.id).to eq data.first['id']
      expect(peep.message).to eq 'Message 2'
      expect(peep.time).to eq data.first['time']

    end

  end

end
