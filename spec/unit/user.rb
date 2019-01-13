require 'user'

describe User do
  subject(:user) { User.new }

  context 'attributes' do
    it 'has an email address' do
      expect(user.email).to eq 'test@test.com'
    end
  end
end
