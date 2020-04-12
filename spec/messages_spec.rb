require 'messages'

describe Messages do 
  describe '.get_all' do 
    it 'returns all messages' do 
      messages = Messages.get_all
      expect(messages).to include('hi')
      expect(messages).to include('databases are fun')
    end 
  end 

end 