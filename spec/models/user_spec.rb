require './app/models/user'

describe User do
  handle = 'the_user'
  email = 'user@example.com'
  password = 'secret1234'

  context 'when there is a user in the db' do

    before do
      user = User.create(name: "user 1",
                        handle: handle,
                        email: email,
                        password: password,
                        password_confirmation: password)
    end

      describe '#authenticate' do
      it 'returns user if username and password match' do
        user = User.authenticate handle, password
        expect(user.handle).to eq handle
      end

      it "returns nil if user name or password does not match" do
        expect(User.authenticate 'wrong', password).to be_nil
        expect(User.authenticate handle, 'wrong').to be_nil
      end
    end
  end
end
