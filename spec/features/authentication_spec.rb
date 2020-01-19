feature 'authentication' do
  scenario 'a user can sign in with the correct credentials' do
    User.create(name: 'Umberto', username: 'uValente', email: 'mock@gmail.com', password: 'psw123')
    visit '/sessions/new'

    fill_in 'email', with: 'mock@gmail.com'
    fill_in 'password', with: 'psw123'
    click_button 'Sign In'

    expect(page).to have_content 'Welcome uValente!'
  end

  scenario 'a user sees an error if signing in with the email password' do
    User.create(name: 'Umberto', username: 'uValente', email: 'mock@gmail.com', password: 'psw123')

    visit '/sessions/new'
    fill_in 'email', with: 'wrong@gmail.com'
    fill_in 'password', with: 'psw123'
    click_button 'Sign In'

    expect(page).not_to have_content 'Welcome uValente'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if signing in with the wrong password' do
    User.create(name: 'Umberto', username: 'uValente', email: 'mock@gmail.com', password: 'psw123')

    visit '/sessions/new'
    fill_in 'email', with: 'mock@gmail.com'
    fill_in 'password', with: 'wrong123'
    click_button 'Sign In'

    expect(page).not_to have_content 'Welcome uValente'
    expect(page).to have_content 'Please check your email or password.'
  end
end
