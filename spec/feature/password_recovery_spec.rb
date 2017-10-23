feature "password recovery" do
  before do
   sign_up
   Capybara.reset!
   allow(SendRecoverLink).to receive(:call)
  end

  scenario 'it calls the SendRecoverLink service to send the link' do
    expect(SendRecoverLink).to receive(:call).with(maker)
    recover_password
  end

end
