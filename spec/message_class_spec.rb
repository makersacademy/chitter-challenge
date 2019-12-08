require 'message_class'
require 'pg'

describe Message do
  describe '#post' do
    it 'saves the message to the database' do
      Message.post("I am cleaning my house")
      status_post = Message.all
      expect(status_post[0].messages).to include("I am cleaning my house")
    end
  end
end
