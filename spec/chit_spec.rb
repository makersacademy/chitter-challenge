require 'chit'
require 'database_helper'

describe Chit do

  describe '.all' do
    it 'returns all chits' do
      # create a connection to db test
      connection  = PG.connect(dbname: 'chit_manager_test')
      # execute connection and insert data
      chit = Chit.add(message: 'This ma chit')
      Chit.add(message: 'This not ma chit')
      chits = Chit.all

      expect(chits.length).to eq 2
      expect(chits.first).to be_a Chit
      expect(chits.first.message).to eq 'This not ma chit' #reverse order!

    end
  end

  describe '.add' do
    it 'adds a new chit' do
       # requires parameter message to be passed
      chit = Chit.add(message: 'Test_chit')
      persisted_data = PG.connect(dbname: 'chit_manager_test').query("SELECT * FROM chits WHERE id = #{chit.id};")
      expect(chit).to be_a Chit
      expect(chit.id).to eq chit.id
      expect(chit.message).to eq 'Test_chit'
    end
  end
end