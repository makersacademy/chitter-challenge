require 'user'

RSpec.describe User do
  describe "#sign_in" do
    it 'returns the user if the given password and email match one found in the database' do
      user_email = 'User1@gmail.com'
      user_password = 'password1'
      
      existing_user = User.sign_in(user_email, user_password)
      existing_user_id = existing_user.id
      expect(existing_user_id).to eq 1
    end
  end
end