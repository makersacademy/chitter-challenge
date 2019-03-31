feature 'authentication' do
  scenario 'a user can sign in' do
    User.create(name: 'Amy Jordan', username: 'amy123', email: 'amy@testemail.com', password: 'password')

    visit('/chitter')
    click_button('Sign in')
    fill_in('username', with: 'amy123')
    fill_in('password', with: 'password')
    click_button('Sign in')
    expect(page).to have_content('Welcome to Chitter, amy123')
  end

  scenario 'user sees an error if they enter an incorrect password' do
    User.create(name: 'Amy Jordan', username: 'amy123', email: 'amy@testemail.com', password: 'password')

    visit('/chitter')
    click_button('Sign in')
    fill_in('username', with: 'amy123')
    fill_in('password', with: 'p4ssword')
    click_button('Sign in')
    expect(page).to have_content('Please check your username or password')
  end
end
