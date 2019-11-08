require 'pg'
require 'message'
require 'user'

describe Message do 
    it 'should return a list of messages' do 
        User.create('rob@rob.com', 'rob')
        id = User.find('rob@rob.com', 'rob').first.id
        p id
        time = Time.new
        Message.create(id, 'Hello it is rob', time)
        
        messages = Message.all

        expect(messages.first.text).to eq "Hello it is rob"
    end
end