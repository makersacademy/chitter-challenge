# require './lib/models/messages.rb'

# RSpec.describe Messages do

#   describe '#.create' do
#     it 'create a new message' do
#       message = Messages.create(text: 'this is a peep')

#       expect(message.text).to eq('this is a peep')
#     end
#   end

#   describe '#.all' do
#     it 'select all the messages in the table' do
#       Messages.create(text: 'this is a peep')
#       message2 = Messages.create(text: 'this is another peep')

#       messages = Messages.all
#       expect(messages.length).to eq(2)
#       expect(message2.text).to eq('this is another peep')
#     end
#   end
# end
