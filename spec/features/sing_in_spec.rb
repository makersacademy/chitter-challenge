feature 'Sign in' do

  let!(:registered_user) { User.create(email: 'enzo@email.com',
                                      name: 'Crescenzo D\'Alterio',
                                      username: 'alterenzo',
                                      password: 'secure_password',
                                      password_confirmation: 'secure_password')}


  scenario 'logging in with an already registered user' do
    sign_in(email: 'enzo@email.com',password: 'secure_password')
    expect(page).to have_content 'Welcome, alterenzo'
  end
end
