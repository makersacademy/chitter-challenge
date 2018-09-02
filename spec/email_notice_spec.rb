require 'email_notice'

describe EmailNotice do

  before(:each) do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO users (name, user_name, email, password) VALUES('test name', 'test user name', 'test@email.com', 'testpassword');")
  end

  describe '#checkpeep' do

    peep = "test peep"
    peep_two = "#test user name"
    current_user_name = "not the user you are looking for"

    it 'returns nil if peep does not contain hashed user name' do
      expect(EmailNotice.check_peep(peep, current_user_name)).to eq nil
    end

    it 'send an email if peep contains a valid hashed user name' do
      allow(EmailNotice).to receive(:send_email_alert).and_return('sent')
      expect(EmailNotice.check_peep(peep_two, current_user_name)).to eq('sent')
    end
  end

end
