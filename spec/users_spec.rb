require 'users'

describe '.create' do
  it 'can create and save a new user' do
    email = 'example@example.com'
    password = 'Pasword123'
    name = 'Wash Hoburn'
    username = 'Leafonthewind'
    user = Users.create(email: email, password: password, name: name, username: username)
    expect(user.email).to eq email
    expect(user.password).to eq password
    expect(user.name).to eq name
    expect(user.username).to eq username
  end
end
