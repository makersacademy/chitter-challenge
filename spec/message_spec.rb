require './lib/message.rb'

describe Message do
  describe '.all' do
    it "lists all messages" do
      connection = PG.connect(dbname: 'chitter_challenge_test')

      connection.exec("INSERT INTO peeps (message) VALUES ('Hello world, I''m chittering!');")
      connection.exec("INSERT INTO peeps (message) VALUES ('Yes, yes you are');")
      connection.exec("INSERT INTO peeps (message) VALUES ('It''s great fun!');")

      messages = Message.all

      expect(messages[-1].message).to eq("Hello world, I'm chittering!")
    end
  end

  describe '.create' do
    it 'creates a peep' do
      message = Message.create(message: 'testing, 1, 2, 3', time: Time.now)

      expect(message.message).to eq('testing, 1, 2, 3')
    end
  end
end
