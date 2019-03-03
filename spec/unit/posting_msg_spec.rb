require 'posting_msg'
describe Chitter do
  describe '.all' do
    it 'shows all the messages' do
      messages = Chat.all
      expect(messages.last.nickname).to eq 'Esmeralda'
      expect(messages.last.msg).to eq 'Envio un mensaje'
    end
  end
end
