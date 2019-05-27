require 'peep'
require 'database_helpers'

describe Peep do
  let(:userid) { 123 }

  describe '#post' do
    it 'should insert an entry into the peep table' do
      peep = Peep.post(text: 'I feel grrrrrreat', userid: userid)
      persisted_data = persisted_data_peeps(id: peep.id)

      expect(peep).to be_an_instance_of Peep
      expect(peep.id).to eq(persisted_data.first['id'])
      expect(peep.text).to eq('I feel grrrrrreat')
    end
  end

  describe '#all' do
    it 'should produce an array of peep objects' do
      Peep.post(text: 'I feel grrrrrreat', userid: userid)
      Peep.post(text: 'I really do', userid: userid)
      peeps = Peep.all
      expect(peeps.all? { |peep| peep.is_a?(Peep) }).to eq(true)
    end
  end

  describe '#get_user' do
    it 'should return the name and username of the peep poster' do
      peep = Peep.post(text: 'I feel grrrrrreat', userid: userid)

      sql = "INSERT INTO users (id, email, password, name, username)
             VALUES('#{userid}', 'a@a.com', '123', 'Laurence', 'L123');"

      DatabaseConnection.query(sql)
      hash = peep.get_user(userid)
      expect(hash['name']).to eq('Laurence')
      expect(hash['username']).to eq('L123')
    end
  end
end
