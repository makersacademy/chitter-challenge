require 'login'

describe Login do
  describe '#user_pass_ok?' do
    it 'returns true if a user and password match' do
      add_some_users
      expect(Login.user_pass_ok?('bombadillo', 'gardener')).to eq true
    end

    it 'returns false if a user and a pass dont match' do
      add_some_users
      expect(Login.user_pass_ok?('bombadillo', 'wrong_pass')).to eq false
    end

    it 'returns false if it cant find a user' do
      add_some_users
      expect(Login.user_pass_ok?('no-one', 'madeuppassword')).to eq false
    end
  end
end
