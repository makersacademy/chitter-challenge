require 'message'

describe Message do

  describe "#add" do
    it 'should add a new message' do
      Message.add("dbacall", "Hello world")
      Message.add("dbacall", "Another message")

      messages = Message.all
    
      expect(messages.last.message).to eq "Another message"
    end


  end

end