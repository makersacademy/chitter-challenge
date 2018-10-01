# require './lib/message'
#
# describe Message do
#
#   describe ".all" do
#     it "should returns a list of messages" do
#       Post.create(content: params[:content], created_at: Time.now, user_id: 1)
#       Post.create(content: params[:content], created_at: Time.now, user_id: 1)
#
#
#       messages = Message.all
#       message = messages.first
#
#       expect(messages.length).to eq 2
#       expect(message).to be_a Message
#       expect(message).to respond_to(:id)
#       expect(message.name).to eq 'Test name 1'
#       expect(message.content).to eq 'Testing content numero uno'
#     end
#   end
#
#   describe '.create' do
#     it 'creates a new message' do
#       message = Message.create(name: 'Test name', content: 'Testing content')
#
#       expect(message).to be_a Message
#       expect(message).to respond_to(:id)
#       expect(message.name).to eq 'Test name'
#     end
#   end
# end
