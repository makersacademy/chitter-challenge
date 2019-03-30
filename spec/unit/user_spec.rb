require 'user'
require 'bcrypt'

describe User do
  it 'hashes the password using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('passwordtest')

    User.create(email: "samantha.ixer@here.com", password: "passwordtest", first_name: "Sam", surname: "Ixer", username: 'sami')
  end

  it 'creates a new user for sign up' do
    expect(User.create(email: "samantha.ixer@here.com", password: "passwordtest", first_name: "Sam", surname: "Ixer", username: 'sami')).to be_a(User)
  end

  it 'throws an error if the username or email already exists' do
    User.create(email: "samantha.ixer@here.com", password: "passwordtest", first_name: "Sam", surname: "Ixer", username: 'sami')
    expect{User.create(email: "samantha.ixer@here.com", password: "passwordtest", first_name: "Sam", surname: "Ixer", username: 'sami')}.to raise_error "That username or email address already exists"
  end
end
