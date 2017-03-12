describe User do

  let!(:user) do
    User.create(email: 'sam@makersacademy.com',
                password: 's3cr3t',
                name: 'Samuel Russell Hampden Joseph',
                username: 'tansaku')
  end

  it 'checks database for valid email address' do
    authenticated_user = User.authenticate(user.email, 's3cr3t')
    expect(authenticated_user).to eq user
  end

end
