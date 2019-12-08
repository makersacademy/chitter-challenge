require 'user'

describe User do

  # subject(:user) { User.new(user_name: 'Sipho Adebayo', user_handle: 'Sips', email: 'sipho_adebayo@test.com', password: 'darby34') }
  #
  # describe "on initialization" do
  #   it "takes a user name, user handle, email and password" do
  #     expect(subject.user_name).to eq 'Sipho Adebayo'
  #     expect(subject.user_handle).to eq 'Sips'
  #   end
  # end

  describe ".create" do
    it "creates a new user" do
      test_database_setup
      clear_users_table
      new_user = User.create(user_name: 'Sipho Adebayo', user_handle: 'Sips', email: 'sipho_adebayo@test.com', password: 'darby34')
      expect(new_user).to be_instance_of User
      expect(new_user.user_name).to eq 'Sipho Adebayo'
      expect(new_user.user_handle).to eq 'Sips'
    end
  end

end
