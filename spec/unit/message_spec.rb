require './lib/message'

# describe 'Message' do
#   describe '#all' do
#     it 'return all messages' do
#       Message.create(msg: 'default test message')
#       Message.create(msg: '2nd test message')
#
#       messages = Message.all
#       expect(messages.msg).to include 'default test message'
#       expect(messages.msg).to include '2nd test message'
#     end
#   end
#   describe '#create' do
#     it 'create a new message' do
#       message = Message.create(msg: '1st test message')
#       persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM messages WHERE id = #{message.id};")
#       expect(message).to be_a Message
#       expect(message.id).to eq persisted_data.first['id']
#       expect(message.msg).to eq '1st test message'
#       expect(message.username).to eq nil
#     end
#   end
# end
