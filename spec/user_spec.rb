require './lib/user'
require 'pg'

describe 'User' do
  describe '.create' do
    it "creates a new user with username, first name, last name" do
        user = User.create(username: "Marcellofabbri", realname: "Marcello", lastname: "Fabbri").first
        persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM users WHERE id = #{user.id};")
  
        expect(user).to be_a User
        expect(user.id).to eq persisted_data.first['id']
        expect(user.username).to eq "Marcellofabbri"
        expect(user.realname).to eq "Marcello"
        expect(user.lastname).to eq "Fabbri"
    end
  end
end