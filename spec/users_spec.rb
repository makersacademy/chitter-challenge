require 'database_helpers'

describe Users do
  describe '#create' do
    it 'can sign up a user and add thier details to the database' do
      table = "users"
      user = Users.create("Someone233", "abcd1234", "someone233@hotmail.com", "Someone", "Somebody")
      persisted_data = persisted_user_data(user.username)

      expect(user.id).to eq persisted_data['id']
      expect(user.forename).to eq persisted_data['forename']
      expect(user.username).to eq persisted_data['username']
      expect(user.password).to eq persisted_data['password']
      expect(user.email).to eq persisted_data['email']
    end
  end
end
