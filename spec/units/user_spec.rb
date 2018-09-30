require 'user'
require 'pg'

describe User do
    context '.create' do
    it "adds new messages" do
      a_new_user = User.create(:email => 'evildoer@hotmail.com', :encrypted_password => 'badperson',:username => 'vaderlover')
      expect(a_new_user.username).to eq 'vaderlover'
    end
  end
end