require 'user'
require 'bcrypt'

describe User do
  before(:each) { truncates }

  it '#create adds a new User to database' do
    User.create('Dave', '@DavetheDev', 'dave@gmail.com', 'Dave1234')
    output = User.all
    expect(output.last.author).to eq('Dave')
    expect(output.last.handle).to eq('@DavetheDev')
    expect(output.last.email).to eq('dave@gmail.com')
  end

  private
  it '#create hashes the password using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('password123')
    User.create('Dave', '@DavetheDev', 'dave@gmail.com', 'password123')
  end

end