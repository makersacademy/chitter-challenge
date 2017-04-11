require 'pry'
describe User do

  let!(:user) do
    User.create(name: 'Trish', email: 'Trish@person.com',
                username: 'Wizard_Trish', password: 'password',
                password_confirmation: 'password')
  end

  it 'authenticates when given a valid username and password' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when give an incorrect password' do
    expect(User.authenticate(user.username, 'wrong')).to be_nil
  end


end
