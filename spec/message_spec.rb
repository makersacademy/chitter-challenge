require_relative '../public/lib/message'


describe Message do

  describe "#add" do
    it 'should add a new message' do
      Message.add("dbacall", "Hello world")
      Message.add("dbacall", "Another message")

      messages = Message.all
    
      expect(messages.first.message).to eq "Another message"
    end

  end

  describe "#tag" do
    it 'should check if there are any users tagged in the message' do
      Account.create('dbacall', 'dbacall@hotmail.co.uk', 'password')
      Account.create('dbacall', 'dbacall@hotmail.co.uk', 'password')
      expect(Message.tag('Hello @dbacall, what up?')).to eq 'dbacall'
    end
  end

end
