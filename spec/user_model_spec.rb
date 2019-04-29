require_relative '../lib/user_model'
require_relative '../spec/db_test_setup'
require 'pg'

RSpec.describe User do
  describe '.create' do
    it 'stores users details in database' do
      user = described_class.create(fname: 'Sarpong', lname: 'Abasimi', email: 'a@demo.com', password: 'pass')
      connection = DataBaseTestSetup.connection
      result = connection.query("SELECT * FROM USERS WHERE id = '#{user.id}'")

      expect(user.id).to eq(result[0]['id'])
      expect(user).to be_a User
    end
  end
end
