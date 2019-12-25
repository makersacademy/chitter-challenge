require 'user'

describe User do

  before do
    test_database_setup
    @new_user = User.create(user_name: 'Sipho Adebayo', user_handle: 'Sips', email: 'sipho_adebayo@test.com', password: 'darby34')
  end

  describe ".create" do
    it "creates a new user" do
      expect(@new_user).to be_instance_of User
      expect(@new_user.user_name).to eq 'Sipho Adebayo'
      expect(@new_user.user_handle).to eq 'Sips'
    end

    it "returns an error if email already has an account assigned to it" do
      expect(User.create(user_name: 'Sips Adebayo', user_handle: 'Sipho', email: 'sipho_adebayo@test.com', password: 'heyo034')).to eq :email_clash
    end

    it "returns an error if user handle already has an account assigned to it" do
      expect(User.create(user_name: 'Sips Adebayo', user_handle: 'Sips', email: 'hello@test.com', password: 'heyo034')).to eq :handle_clash
    end
  end

  describe ".authenticate" do
    it "returns an instance of User if email and password exist" do
      user = User.authenticate(email: 'sipho_adebayo@test.com', password: 'darby34')
      expect(user).to be_instance_of User
      expect(user.user_name).to eq 'Sipho Adebayo'
      expect(user.user_handle).to eq 'Sips'
    end

    it "returns false if email does not exist" do
      expect(User.authenticate(email: 'sipho@test.com', password: 'darby34')).to be false
    end

    it "returns false if password does not exist" do
      expect(User.authenticate(email: 'sipho@test.com', password: 'da50')).to be false
    end
  end

end
