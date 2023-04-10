require 'message_repository'
require 'message'

def reset_messages_table
    seed_sql = File.read('spec/seeds/seeds_chitter_challenge_test.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
    connection.exec(seed_sql)
end

RSpec.describe MessageRepository do

    before(:each) do 
        reset_messages_table
    end

    context 'testing the MessageRepository class' do
        it 'return all messages' do
            repo = MessageRepository.new
            message = repo.all

            expect(message.length).to eq 3 
            expect(message[0].id).to eq 1 
            expect(message[0].title).to eq 'paired programming' 
            expect(message[0].content).to eq 'learning to pair program'
            expect(message[0].tags).to eq '@mat'
        end

        it 'create a new message' do
            repo = MessageRepository.new

            new_message = Message.new
            new_message.title = 'my project'
            new_message.content = 'chitter challenge ongoing'
            new_message.tags = '@mat'
            new_message.posted_by = 'toppy'

            repo.create(new_message)
            message = repo.all

            expect(message.length).to eq 4
            expect(message.last.title).to eq 'my project'
            expect(message.last.content).to eq 'chitter challenge ongoing'
            expect(message.last.tags).to eq '@mat'
            expect(message.last.posted_by).to eq 'toppy'
        end
    end
end