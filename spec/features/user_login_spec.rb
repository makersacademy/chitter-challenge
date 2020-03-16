feature 'registration' do
  scenario 'user can setup an account' do
    register

    expect(page).to have_content('testusername', 'testemail@gmail.com')
  end

  scenario 'user can login' do
    login

    expect(page).to have_content('testusername', 'testemail')
  end

  scenario 'logged in user sees tweets on login page' do
    register
    visit('/login')

    expect(page).to have_content('Welcome back testusername')
  end
end
