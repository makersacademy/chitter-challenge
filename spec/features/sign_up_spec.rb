feature 'Signing up' do

  let!(:registered_user) { User.create(email: 'enzo@email.com',
                                      name: 'Crescenzo D\'Alterio',
                                      username: 'alterenzo',
                                      password: 'secure_password',
                                      password_confirmation: 'secure_password')}

  scenario 'singing in a new user' do
    expect{ sign_up }.to change(User, :count).by(1)
  end

  scenario 'failing password confirmation' do
    expect{ sign_up(password_confirmation: '4321') }.not_to change(User, :count)
  end

  scenario 'failing to submit a valid email address' do
    expect{ sign_up(email: 'test.test.com') }.not_to change(User, :count)
  end

  scenario 'trying to register with an already used email address' do
    expect{ sign_up(email: 'enzo@email.com')}.not_to change(User, :count)
  end

  scenario 'trying to register with an already used username' do
    expect{ sign_up(username: 'alterenzo')}.not_to change(User, :count)
  end
end
