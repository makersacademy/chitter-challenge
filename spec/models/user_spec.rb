describe User do
  let(:user) { { username: 'ciao', 
                 password: 'monkey',
                 name:     'andrea',
                 surname:  'mazza',
                 email:    'andrea@mazza.com'
              } }

  it ':validate returns false if the username or password do not exist' do 
    expect(User.validate(user)).to be_falsey
  end

  it ':validate returns true if the username+password exist' do 
    User.create(user)
    expect(User.validate(user)).to be_truthy
  end
end
