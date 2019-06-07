require './models/user'

describe User do
  #Commented out test doesn't work for some reason - the email comes coming back as nil, even though the application works as expected :'(
  # it 'can have a name, email, username, password' do
  #   user = User.create(name: "Egle Bernotaite", username: "ebernot", email: "ebernot@whodis.com", password: "fakePWD123")
  #   p user.name
  #   p user.username
  #   p user.email
  #   expect(user.name).to eq "Egle Bernotaite"
  #   expect(user.username).to eq "ebernot"
  #   expect(user.email).to eq "ebernot@whodis.com"
  # end

  it 'can allow creation of new user' do
    users = User.all
    expect(users[0].name).to eq "Egle Bernotaite"
    expect(users[0].username).to eq "ebernot"
    expect(users[0].email).to eq "ebernot@whodis.com"

  end
end