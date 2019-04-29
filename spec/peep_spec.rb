require 'peep'

describe Peep do
  let(:msg) { 'I love chitter' }
  let(:time) { Time.now }
  let(:user_id) { 1 }

  describe '.create' do
    it 'returns a new peep instance' do
      peep = Peep.create(message: msg, time: time, user_id: user_id)

      expect(peep).to be_a Peep
      expect(peep.id).to be_a Integer
      expect(peep.message).to eq msg
      expect(peep.time).to eq time.strftime('%Y-%m-%d %H:%M:%S%z')[0, 22]
      expect(peep.user_id).to eq user_id
    end

    it 'adds new peep to the database' do
      peep = Peep.create(message: msg, time: time, user_id: user_id)
      sql = "SELECT * FROM peeps WHERE id = #{peep.id};"
      result = DatabaseConnection.execute(sql).first

      expect(peep.id).to eq result['id'].to_i
      expect(peep.message).to eq result['message']
      expect(peep.user_id).to eq result['user_id'].to_i
      expect(peep.time).to eq result['time']
    end
  end

  describe '.all' do
    it 'returns all peeps as array of peep instances' do
      peep_1 = Peep.create(message: 'msg_1', time: time, user_id: 1)
      peep_2 = Peep.create(message: 'msg_2', time: time, user_id: 2)
      peep_3 = Peep.create(message: 'msg_3', time: time, user_id: 3)

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep_1.id
      expect(peeps[1].message).to eq peep_2.message
      expect(peeps.last.user_id).to eq peep_3.user_id
    end
  end
end
