require 'users'

RSpec.describe Users do

  before (:all) do
    test_configure
  end

  context 'create user' do
    it 'should raise error for invalid password length' do
      expect { Users.create_user('Debora', 'debora@email.com', 'dfc') }.to raise_error 'username, email or password not valid'
    end
  end

  context 'create user' do
    it 'should raise error for invalid email content' do
      expect { Users.create_user('Debora', 'debora%email.com', 'dddvfc') }.to raise_error 'username, email or password not valid'
    end
  end
end
