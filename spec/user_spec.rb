# require 'pg'
# require 'user'

# describe '.create' do
#   it 'creates a new user' do
#     user = User.create(email: 'test@example.com', password: 'password123')

#     connection = PG.connect(dbname: 'peep_manager_test')
#     connection.query("SELECT * FROM peeps WHERE id = 1;")

#     expect(user).to be_a User
#     expect(user.email).to eq 'test@example.com'
#   end
# end

# describe '.find' do
#   it 'finds a user by ID' do
#     user = User.create(email: 'test@example.com', password: 'password123')
#     result = User.find(id: user)

#     expect(result.id).to eq user.id
#     expect(result.email).to eq user.email
#   end

#   it 'returns nil if there is no ID given' do
#     expect(User.find(nil)).to eq nil
#   end

# end
