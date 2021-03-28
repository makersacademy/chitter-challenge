require 'peeps'

describe Peep do
    it 'displays all peeps' do
        connection = PG.connect(dbname: 'chitter_test')

        connection.exec("INSERT INTO chitter_table (peep) VALUES ('Peep peep!');")

        peeps = Peep.all_peep

        expect(peeps).to include ('Peep peep!')
    end

    it 'displays posted peeps' do
        expect(Peep).to respond_to :all_peep
    end

    describe '#post_peep' do
        it 'allows user to post a peep' do
            adding_peep = Peep.post_peep("test_user", "Hello world!")
            
            expect(adding_peep).to include ('Hello world!')
        end
    end
end
