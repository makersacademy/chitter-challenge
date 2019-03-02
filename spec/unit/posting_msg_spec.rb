require 'posting_msg'
# require 'database_helpers'
describe Chitter do
  describe '.all' do
    it 'shows all the messages' do
      Chat.add(nickname: 'Esmeralda', msg: 'Envio un mensaje')
      Chat.add(nickname: 'Carlitos', msg: 'No se que escribir')
      Chat.add(nickname: 'Esmeralda', msg: 'Envio mi segundo mensaje')
      messages = Chat.all
      expect(messages.first.nickname).to eq 'Esmeralda'
      expect(messages.first.msg).to eq 'Envio un mensaje'
    end
  end
  describe '.add' do
    it 'creates new posts' do
      msg = Chat.add(nickname: 'Esmeralda', msg: 'Envio un mensaje')
      expect(msg.nickname).to eq 'Esmeralda'
      expect(msg.msg).to eq 'Envio un mensaje'
    end
  end
end
