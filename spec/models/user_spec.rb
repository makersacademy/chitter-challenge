require './app/models/user'

describe User do
  user_name = 'the_user'
  email = 'user@example.com'
  password = 'secret1234'

  context 'when there is a user in the db' do

    before do
      user = User.create(name: "user 1",
                        user_name: user_name,
                        email: email,
                        password: password,
                        password_confirmation: password)
    end

      describe '#authenticate' do
      it 'returns user if username and password match' do
        user = User.authenticate user_name, password
        expect(user.user_name).to eq user_name
      end

      it "returns nil if user name or password does not match" do
        expect(User.authenticate 'wrong', password).to be_nil
        expect(User.authenticate user_name, 'wrong').to be_nil
      end
    end
  end
end
