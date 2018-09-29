require 'message'
require 'pg'

describe Message do
  context '.all' do
    it 'adds messages' do
      connection = PG.connect(dbname: 'twittarr_test')
      connection.exec("INSERT INTO messages (message) VALUES ('Arrr, my spleen!');")
      
      expect(Message.all).not_to be_empty
    end
  end
  
  context '.create' do
    it "adds new messages" do
      our_message = Message.create(:message => "Her locker is like davey jones locker!", :created_at => Time.now)
      expect(our_message.message).to eq 'Her locker is like davey jones locker!'
    end
  end
end
