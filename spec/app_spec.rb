describe "App" do

  before(:each) do
    reset_test_data
  end
  
  describe "GET '/'" do 
    it 'returns a 200 status code' do 
      get '/'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Welcome to Chitter!")
      expect(last_response.body).to include("More content")
    end
  end
end

def reset_test_data
  ActiveRecord::Base.connection_pool.with_connection do |conn|
    conn.execute("TRUNCATE users, peeps RESTART IDENTITY")
  end
  User.create!(username: "user_1", password: "password123", real_name: "User One", email: "user1@user.com")
  User.create!(username: "user_2", password: "password123", real_name: "User One", email: "user2@user.com")
  Peep.create!(content: "Some content", user_id: 1)
  Peep.create!(content: "More content", user_id: 2)
end