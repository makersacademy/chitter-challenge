require 'posting_msg'
require 'setup_test_database'
describe Chitter do
  describe '.all' do
    it 'shows all the messages' do
      setup_test_database
      messages = Chat.all
      expect(messages.last.nickname).to eq 'Esmeralda'
      expect(messages.last.msg).to eq 'Envio un mensaje'
    end
  end
end
