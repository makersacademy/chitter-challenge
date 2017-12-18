require './app/lib/mailer'

describe Mailer do 
	let(:mail_gun) {double(:mail_gun)}
	let(:email) {'test@test.com'}
	let(:user) {double(:user, username: 'bob')}
	let(:from) {double(:peep, user: user, time: '12:00', peep: 'whatever')}
	subject {Mailer}
  describe '#mail' do

  	it 'calls the MailGun' do
  	  expect(mail_gun).to receive_message_chain(:new, :send_message)
  	  Mailer.mail(email, from, mail_gun)
  	end
  end
end