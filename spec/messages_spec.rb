require 'messages'

describe Messages do
    it 'creates an instance of the message class' do
        expect(subject).to be_an_instance_of(Messages)
    end

    describe '#return_messages' do
        it 'returns a list of messages' do
            connection = PG.connect(dbname: 'chitter_test')
            
            connection.exec("INSERT INTO messages VALUES(1, 1, 'Jesus is King is now out', '13:00:00.0000000');")
            connection.exec("INSERT INTO messages VALUES(2, 1, 'Don't listen to it', '13:10:00.0000000');")
            connection.exec("INSERT INTO messages VALUES(3, 2, 'TDE tour soon', '13:20:00.0000000');")

            messages = Chitter.return_messages

            expect(messages).to include "Jesus is King is now out"
            expect(messages).to include "Don't listen to it"
            expect(messages).to include "TDE tour soon"     
        end
    end
end