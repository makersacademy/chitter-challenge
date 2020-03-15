feature 'registration' do
   scenario 'user can setup an account' do
     login

    expect(page).to have_content('testusername', 'testemail@gmail.com')
  end

  scenario 'user can login and then tweet from their account' do
    login
    visit('/login')

    expect(page).to have_content('Welcome back testusername')
  end
end
