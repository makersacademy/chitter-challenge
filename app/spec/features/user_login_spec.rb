feature 'registration' do
   scenario 'user can setup an account' do
     register

    expect(page).to have_content('testusername', 'testemail@gmail.com')
  end

  scenario 'user can login and then tweet from their account' do
    register
    visit('/login')

    expect(page).to have_content('Welcome back testusername')
  end
end
