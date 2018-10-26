require './lib/message.rb'

describe Message do
  describe '.all' do
    it "lists all messages" do
      connection = PG.connect(dbname: 'chitter_challenge_test')

      connection.exec("INSERT INTO peeps (message) VALUES ('Hello world, I''m chittering!');")
      connection.exec("INSERT INTO peeps (message) VALUES ('Yes, yes you are');")
      connection.exec("INSERT INTO peeps (message) VALUES ('It''s great fun!');")

      messages = Message.all

      expect(messages).to include "Hello world, I'm chittering!"
      expect(messages).to include "Yes, yes you are"
      expect(messages).to include "It's great fun!"
    end
  end

  describe '.create' do
    it 'creates a peep' do
      Message.create(body: 'testing, 1, 2, 3')

      expect(Message.all).to include('testing, 1, 2, 3')
    end
  end
end
