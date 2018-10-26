require 'user'

describe User do

  describe '.create' do
    before do
      @user_one = User.create(username: "user1", password: "password1", name: "Mr User", email: "user1@example.com")
    end

    it 'returns a user' do
      expect(@user_one).to be_a User
    end

    it 'hashes password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password2')
      User.create(username: "user2", password: "password2", name: "Mrs User", email: "user2@example.com")
    end

    it 'sets attributes of returned user' do
      expect(@user_one.username).to eq "user1"
      expect(@user_one.password).to eq "password1"
      expect(@user_one.name).to eq "Mr User"
      expect(@user_one.email).to eq "user1@example.com"
    end

    it 'logs in' do
      expect(User.current).to eq @user_one
    end
  end

  describe '.authenticate' do
    context "with valid details" do
      before do
        User.create(username: "user1", password: "password1", name: "Mr User", email: "user1@example.com")
        User.authenticate(username: "user1", password: "password1")
        @user = User.current
      end

      it 'changes current user to match details' do
        expect(@user.username).to eq "user1"
        expect(@user.password).to eq "password1"
      end

      it 'finds other details of current user' do
        expect(@user.name).to eq "Mr User"
        expect(@user.email).to eq "user1@example.com"
      end
    end

    context "with invalid details" do
      before do
        @result = User.authenticate(username: "user1", password: "wrong")
      end

      it "should return false" do
        expect(@result).to be_falsy
      end

      it "should not set current user" do
        expect(User.current).to be_nil
      end
    end
  end

  describe '.sign_out' do
    it 'resets User.current' do
      User.create(username: "user1", password: "password1", name: "Mr User", email: "user1@example.com")
      User.sign_out
      expect(User.current).to be_nil
    end
  end
end
