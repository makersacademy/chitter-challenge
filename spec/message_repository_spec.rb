require 'message_repository'


def reset_tables
    seed_sql = File.read('spec/seeds/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
end
  
describe MessageRepository do
    before(:each) do 
        reset_tables
    end

    context "all funcition" do
        it "returns the second row from the messages table" do
            repo = MessageRepository.new
            all_messages = repo.all

            expect(all_messages.length).to eq 3
            expect(all_messages[1].message).to eq 'It is too hot today'
            expect(all_messages[1].date).to eq '2022-11-07 00:00:00'
            expect(all_messages[1].author_id).to eq '2'
        end
    end

    context 'messages with authors names funnction' do
        it "returns the first message with author" do
            repo = MessageRepository.new
            messages_with_authors = repo.messages_with_authors
            expect(messages_with_authors[0].message).to eq 'I had a tasty salad'
            expect(messages_with_authors[0].date).to eq '2022-07-14 00:00:00'
            expect(messages_with_authors[0].author).to eq 'Irina'
        end

        xit "returns third message with author" do 
            repo = MessageRepository.new
            messages_with_authors = repo.messages_with_authors
            expect(messages_with_authors[2].message).to eq 'We need to go to the beach'
            expect(messages_with_authors[2].date).to eq '2022-11-07 00:00:00'
            expect(messages_with_authors[2].author).to eq 'Julien'
        end

        it 'returns all messages in chronological order' do
            repo = MessageRepository.new
            messages_with_authors = repo.messages_with_authors
        end
    end
  
    context "create function" do
        it "creates a new message in the db" do
            repo = MessageRepository.new
            message = Message.new
            message.message = 'Test message'
            message.date = '2022-07-10'
            message.author_id = 1
            repo.create(message)

            all_messages = repo.all
            last_message = all_messages.last
            expect(last_message.message).to eq 'Test message'
            expect(last_message.date).to eq '2022-07-10 00:00:00'
            expect(last_message.author_id).to eq '1'
        end
    end

end