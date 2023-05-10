require 'user'

RSpec.describe User do
  describe "#authenticate" do
    it 'returns the user if the given password and email match one found in the database' do
      user_email = 'User1@gmail.com'
      user_password = 'password1'
      
      authenticated_user = User.authenticate(user_email, user_password)
      authenticated_user_id = authenticated_user.id
      expect(authenticated_user_id).to eq 1
    end
  end
end