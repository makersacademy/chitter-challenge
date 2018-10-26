require 'user'

describe User do
  describe 'check_details' do
    it 'should check the sign up username and email are not already in our database' do
      User.sign_up("anouskahopkins@gmail.com", "hello1234", "anouska hopkins", "ach94")
      expect(User.sign_up("anouskahopkins@gmail.com", "hello1234", "anouska hopkins", "ach94")).to raise_error 'email or username already taken!'
    end
  end
end
