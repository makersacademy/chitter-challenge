require_relative '../lib/user'
require 'database_helpers'

describe User do

  describe '.create' do
    it 'creates a user' do
      connection = PG.connect(dbname: 'chitter_manager_test')
      user_one = User.create(first_name: 'Shirley', last_name: 'Macfarlane', user_email: 'mc@gmail.com', user_password: '1234', user_name: 'sam11')
      persisted_data = persisted_data(id: user_one.id)


      expect(user_one).to be_a User
      expect(user_one.id).to eq persisted_data.first['id']
      expect(user_one.first_name).to eq 'Shirley'
    end
  end

end