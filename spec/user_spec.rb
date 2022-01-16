require 'user'

describe User do
  it 'Users registers thei details' do
    user = User.create(name: 'Pingu Penguin', username: 'Pingu', email: 'pingu@penguin.co.uk', password: 'meepmoop')
    expect(user.name).to eq 'Pingu Penguin'
    expect(user.username).to eq 'Pingu'
    expect(user.email).to eq 'pingu@penguin.co.uk'
    expect(user.password).to eq 'meepmoop'
  end
end