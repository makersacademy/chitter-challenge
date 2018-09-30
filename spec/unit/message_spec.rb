# require 'message'
#
# describe Message do
#     it 'expects to find a message in the database' do
#       Message.create(
#         :body       => "This is a message here",
#         :userid     => 1,
#         :time => "Tuesday"
#       )
#       message = Message.first(:body => "This is a message here")
#       expect(message['body']).to eq "This is a message here"
#     end
# end
