require 'chitter'
require 'pg'

describe Chitter do
  describe '.create' do
    it 'creates a new message' do
      chitter = Chitter.create(message: 'Test')
    #  persisted_data = PG.connect(dbname: 'Twitter_clone_test').query("SELECT * FROM chitter WHERE id = #{chitter.id};")
      expect(chitter).to be_a Chitter
    #  expect(chitter.id).to eq persisted_data.first['id']
      expect(chitter.message).to eq 'Test'
    end
  end
end
