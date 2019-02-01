require 'user'

describe User do

  it 'should return all stored users in an array' do
    user = User.add_new("Jane", "jane@jane.com", "janepass")
    expect(User.all).to be_a Array
    expect(User.all.first).to be_a User
  end

  it 'should add a user' do
    user = User.add_new("Jane", "jane@jane.com", "janepass")
    expect(User.all.last.name).to eq "Jane"
  end

  it 'should retrive user data given the session id' do
    user = User.add_new("Jane", "jane@jane.com", "janepass")
    search = User.find(1)
    expect(search.last.name).to eq "Jane"
  end

  # it 'should retrive user data given the email address' do
  #   user = User.add_new("Jane", "jane@jane.com", "janepass")
  #   search = User.find_user("jane@jane.com")
  #   expect(search.last.name).to eq "Jane"
  # end

  it 'should retrieve data given the session id' do
  end
end


# # in spec/user_spec.rb
# require 'database_helpers'
#
# describe '.create' do
#   it 'creates a new user' do
#     user = User.create(email: 'test@example.com', password: 'password123')
#
#     persisted_data = persisted_data(table: :users, id: user.id)
#
#     expect(user).to be_a User
#     expect(user.id).to eq persisted_data.first['id']
#     expect(user.email).to eq 'test@example.com'
#   end
# end
