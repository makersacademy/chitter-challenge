require 'user'

describe User do
  before(:each) { truncates }

  it '#create adds a new User to database' do
    User.create('Dave', '@DavetheDev', 'dave@gmail.com', 'Password1234')
    output = User.all
    expect(output.last.author).to eq('Dave')
    expect(output.last.handle).to eq('@DavetheDev')
    expect(output.last.email).to eq('dave@gmail.com')
  end

  # it '#authenticate returns a user given a correct handle and password' do
  #   user = User.create('Dave', '@DavetheDev', 'dave@gmail.com', 'Password1234')
  #   authenticated_user = User.authenticate('@DavetheDev', 'Password1234')
  #   expect(authenticated_user.id).to eq user.id
  # end

  private
  it '#create hashes the password using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('password123')
    User.create('Dave', '@DavetheDev', 'dave@gmail.com', 'password123')
  end

end