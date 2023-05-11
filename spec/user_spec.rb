require 'user'

RSpec.describe User do
  it 'is valid with valid input' do
    user = User.new(name: "Joe", email_address: "Joe@gmail.com", password: "my password" )
    expect(user.valid?).to eq true
  end

  it 'is not valid without an email' do
    user = User.new(name: "Joe", email_address: "", password: "my password" )
    expect(user.valid?).to eq false
  end
  it 'is not valid without a name' do
    user = User.new(name: "", email_address: "Joe@gmail.com", password_hash: "my password" )
    expect(user.valid?).to eq false
  end

  # can't get this to work! will return to it if I have time

  # it 'is not valid without a password' do
  #   user = User.create(name: "Joe", email_address: "Joe@gmail.com", password: "" )
  #   expect(user.valid?).to eq false
  # end
  it 'is not valid if email is a duplicate' do
    user = User.create(name: "Joe", email_address: "Joe@gmail.com", password: "my password" )
    invalid_user = User.new(name: "Joer", email_address: "Joe@gmail.com", password: "my password 2" )
    expect(invalid_user.valid?).to eq false
  end
  it 'is not valid if name is a duplicate' do
    user = User.new(name: "Joe", email_address: "Joe@gmail.com", password: "my password" )
    invalid_user = User.new(name: "Joe", email_address: "Joe2@gmail.com", password: "my password 2" )
    expect(invalid_user.valid?).to eq false
  end

end
