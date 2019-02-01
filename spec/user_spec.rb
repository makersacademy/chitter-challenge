require 'user'

describe User do

  it 'should return all stored users in an array' do
    expect(User.all).to be_a Array
    expect(User.all.first).to be_a User
  end

  it 'should add a user' do
    user = User.add_new("Jane", "jane@jane.com", "janepass")
    expect(User.all.last.name).to eq "Jane"
  end

  it 'should retrive user data given the email address' do
    user = User.add_new("Jane", "jane@jane.com", "janepass")
    search = User.find_user("jane@jane.com")
    expect(search.last.name).to eq "Jane"
  end
end
