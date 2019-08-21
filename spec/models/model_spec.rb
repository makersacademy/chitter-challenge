# require './lib/models/model.rb'

# RSpec.describe Message do

#   describe '#.create' do
#     it 'create a row with id, message' do
#       user = User.create(email: 'nnn@mail.com', password: 'ccffrr', name: 'name', user_name: 'username')
#       Message.create(text: 'first message') #, user_id: user.id)
#       message = Message.all[0]

#       expect(message.id).not_to be(nil)
#       expect(message.text).to eq 'first message'
#       # expect(message.user_id).to eq user.id
#     end

#     it 'record the timre of creation' do
#       user = User.create(email: 'nnn@mail.com', password: 'ccffrr', name: 'name', user_name: 'username')
#       message = Message.create(text: 'first message') #, user_id: user.id)
#       message_time = message.created_at.strftime("%Y-%m-%d %H:%M")
#       time = Time.now.strftime("%Y-%m-%d %H:%M")

#       expect(message_time).to eq(time)
#     end
#   end
# end

# RSpec.describe User do

#   describe '#.create' do
#     it 'craete a user' do
#       User.create(email: 'nnn@mail.com', password: 'ccffrr', name: 'name', user_name: 'username')
#       user = User.all[0]
      
#       expect(user.email).to eq('nnn@mail.com')
#       expect(user.password).to eq('ccffrr')
#       expect(user.name).to eq('name')
#       expect(user.user_name).to eq('username')
#     end
#   end
# end