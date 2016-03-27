require './app/models/user'

describe User do
  let(:user) { described_class.new(username: :fake_name, email: :fake_email, password: :fake_password)}
    describe '#authenticate' do
      it '> returns true if password matches database password' do
        expect(user.authenticate(:fake_password)).to eq(true)
      end
    end
end
