describe 'Find User by id' do

  it 'fails when user does not exist' do
    user = User.find(id: 1)

    expect(user).to be_nil
  end

end
