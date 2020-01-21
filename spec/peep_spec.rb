require 'peep'

describe Peep do

    it 'tests successfully connect to chitter_manager_test' do
      connection = PG.connect(dbname: 'chitter_manager_test')

      expect { connection.exec("INSERT INTO peeps VALUES(1, 'My first peep');") }.not_to raise_error
    end

    describe '.create' do
      it 'saves a peep in Chitter Manager' do
        peep = Peep.create('My new peep')

        expect(peep).to be_a Peep
        expect(peep.message).to include 'My new peep'

      end
    end
  end
