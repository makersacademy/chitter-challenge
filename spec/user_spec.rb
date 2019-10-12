require 'user'

describe User do
  subject(:user) { User.create(name: "Guy", handle: 'guy', passhash: '') }
  it 'knows its name' do
    expect(user.name).to eq "Guy"
  end
  it 'knows its handle' do
    expect(user.handle).to eq 'guy'
  end
end