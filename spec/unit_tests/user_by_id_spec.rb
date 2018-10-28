describe 'Find User by id' do

  it 'fails when user does not exist' do
    user = User.find(id: 1)

    expect(user).to be_nil
  end

  it "returns user if the id exists" do
    signed_up_user = User.sign_up(name: 'a name', email: 'an email', username: 'a username', password: 'a password')

    found_user = User.find(id: signed_up_user.id)

    expect(found_user.id).to eq signed_up_user.id
    expect(found_user.name).to eq 'a name'
    expect(found_user.email).to eq 'an email'
    expect(found_user.username).to eq 'a username'
  end

end
