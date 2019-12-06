require './lib/message.rb'

describe Message do

  describe "#add" do
    it 'should add a new message' do
      Message.add("Hello world")
    end


  end

end