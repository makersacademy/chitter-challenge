describe User do
  let!(:user) do
    User.create(:first_name => 'George',
                :last_name => 'Lamprakis',
                :username => 'mormolis',
                :email => 'mormolis@example.com', 
                :password => '$2a$10$Wvsf3FLgypp/vxGAWjlSzukn3vDkyAC/bFqMIvzQAi50wrIWjoB4W')

  end

  # it 'authenticates when given a valid email address and password' do
  #   pass = user.password
  #   authenticated_user = User.authenticate(user.username, pass)
  #   expect(authenticated_user).to eq user
  # end
end
