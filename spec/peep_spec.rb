require 'peeps'

describe Peep do
    it 'displays all peeps' do
        connection = PG.connect(dbname: 'chitter_test')

        connection.exec("INSERT INTO chitter_table (peep) VALUES ('Peep peep!');")

        peep_status = Peep.all_peep

        expect(peep_status).to eq ('Peep peep!')
    end

    it 'displays posted peeps' do
        expect(Peep).to respond_to :all_peep
    end
end
