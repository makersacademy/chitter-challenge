require 'message'

describe Message do

  describe "#add" do
    it 'should add a new message' do
      Message.add("Hello world")
      Message.add("Another message")

      messages = Message.all
    
      expect(messages.last.message).to eq "Another message"
    end


  end

end