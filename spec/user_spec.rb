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
  end

  describe ".authenticate" do
    it "returns an instance of User if email and password exist" do
      user = User.authenticate(email: 'sipho_adebayo@test.com', password: 'darby34')
      expect(user).to be_instance_of User
      expect(user.user_name).to eq 'Sipho Adebayo'
      expect(user.user_handle).to eq 'Sips'
    end

    it "returns an error if email does not exist" do
      message = 'Email or password do not exist'
      expect{ User.authenticate(email: 'sipho@test.com', password: 'darby34') }.to raise_error message
    end

    it "returns an error if password does not exist" do
      message = 'Email or password do not exist'
      expect{ User.authenticate(email: 'sipho@test.com', password: 'da50') }.to raise_error message
    end
  end

end
