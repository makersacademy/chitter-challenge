require './app/models/user.rb'

describe User do
  let!(:user) do
    User.create(name: 'louisa',
                email: 'louisa@example.com',
                username: 'louisaspicer',
                password: 'greatpassword',
                password_confirmation: 'greatpassword')
    end

  it "should authenticate when given a correct username and password" do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

  it "should not authenticate when given an incorrect username or password" do
    unauthenticated_user = User.authenticate(user.username, 'wrong')
    expect(unauthenticated_user).to be_nil
  end

end
