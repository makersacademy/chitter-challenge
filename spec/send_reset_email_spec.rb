describe SendResetEmail do
  let(:user) { double :user, password_token: 'qwertyuiop12fe23',
               email: 'user@example.com' }
  let(:email_client) { double :email_client }
  subject { SendResetEmail.new(user: user, client: email_client) }

  it 'passes a recovery message to an email client' do
    expect(email_client).to receive(:send_message).with(
      to: user.email,
      message: "You have requested a password reset. Follow this link to continue:
      http://www.chitter.com/password_reset/#{user.password_token}"
    )

    subject.call
  end
end
