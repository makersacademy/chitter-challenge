require 'message_repository'
require 'message'

describe Message do
  def reset_tables
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_tables
  end
  
  context "all" do
    it "returns all messages in descending order" do
      repo = MessageRepository.new

      messages = repo.all

      expect(messages.length).to eq 5

      expect(messages[0].id).to eq  "5"
      expect(messages[0].message).to eq  'Shame to miss you Rossita, see you later Moon'
      expect(messages[0].time).to eq '2022-09-01 11:16:45'
      expect(messages[0].handle).to eq  'singStar'

      expect(messages[1].id).to eq  "4"
      expect(messages[1].message).to eq  'Sorry guys I can\'t make it'
      expect(messages[1].time).to eq '2022-09-01 11:15:01'
      expect(messages[1].handle).to eq  'singForever'
    end
  end

  context "create new message" do
    it "creates a new message in the database" do

      repo = MessageRepository.new

      new_message = Message.new
      new_message.message = 'I need to go for a walk'
      new_message.person_id = 3

      query = repo.create(new_message)

      messages = repo.all

      expect(messages.length).to eq 6
    end
  end
end