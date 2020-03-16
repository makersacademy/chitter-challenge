require 'database_helpers'
require 'user'
require 'message'

describe Message do

    describe '.all' do
        it 'requrns messages' do
            user = User.create(user_id: "bob", name: "Bob", email: "bob@bob.bob", password: "bob")
            message = Message.create(user_id: user.user_id, time: "2020-03-15 18:41:25+00", content: "Test message")
            Message.create(user_id: user.user_id, time: "2020-03-15 18:42:25+00", content: "Test message two")
            
            messages = Message.all

            expect(messages.length).to eq 2
            expect(messages.first).to be_a Message
            expect(messages.first.id).to eq message.id
            expect(messages.first.content).to eq "Test message"
            expect(messages.first.user_id).to eq user.user_id
            expect(messages.first.time).to eq "2020-03-15 18:41:25+00"

        end
    end


    describe '.create' do
        it 'creates a new message' do
            user = User.create(user_id: "bob", name: "Bob", email: "bob@bob.bob", password: "bob")
            message = Message.create(user_id: user.user_id, time: "2020-03-15 18:41:25+00", content: "Test message")

            persisted_data = persisted_data(table: 'messages', id: message.id)

            expect(message).to be_a Message
            expect(message.id).to eq persisted_data.first['id']
            expect(message.content).to eq "Test message"
            expect(message.user_id).to eq user.user_id
            expect(message.time).to eq "2020-03-15 18:41:25+00"
        end
    end
end