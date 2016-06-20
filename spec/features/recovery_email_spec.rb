# feature 'send recovery email' do
#
#   before do
#      sign_up
#      Capybara.reset!
#      allow(SendRecoverLink).to receive(:call)
#    end
#
#   scenario 'it calls the SendRecoverLink service to send the link' do
#     expect(SendRecoverLink).to receive(:call).with(user)
#     recover_password
#   end
#
# end
