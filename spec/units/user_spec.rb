require 'user'
require 'pg'

describe User do
  context '.all' do
    it 'exists' do
      connection = PG.connect(dbname: 'twittarr_test')
      connection.exec("INSERT INTO messages (message) VALUES ('Arrr, my spleen!');")
      
      expect(Message.all).not_to be_empty
    end
  end
  
  context '.create' do
    it "adds new messages" do
      a_new_user = User.create(:email => 'evildoer@hotmail.com', :encrypted_password => 'badperson',:username => 'vaderlover')
      expect(a_new_user.username).to eq 'vaderlover'
    end
  end
end