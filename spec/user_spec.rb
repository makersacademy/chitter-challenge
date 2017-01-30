require './app/models/user'

describe User do

  describe "#authenticate" do
    let(:user) { User.create(name: 'Ada Lovelace', user_name: 'Mech01001',email: 'adalove@gmail.com', password: 'LogicLove', password_confirmation: 'LogicLove') }
    it 'confirm the user exists when given user_name and password' do
      existing_user = User.authenticate(user.user_name, user.password)
      expect(existing_user).to eq user
    end

    it 'doesn\'t authenticate unexisting users' do
      existing_user = User.authenticate('blabla123', user.password)
      expect(existing_user).to eq nil
    end

  end

end
