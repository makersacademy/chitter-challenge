# describe SendResetEmail do
#   let(:user) { double :user, password_token: 'qwertyuiop12fe23',
#                email: 'user@example.com' }
#   let(:email_client) { double :email_client }
#   subject { SendResetEmail.new(user) }
#
#   it 'passes a recovery message to an email client' do
#
#     expect(email_client).to receive(:send_message)
#     subject.send_message
#   end
# end
