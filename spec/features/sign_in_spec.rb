feature 'Sign in:' do
  scenario 'form for existing users to sign in' do
    visit('/users/sign_in')
    expect(page).to have_field('username_or_email')
    expect(page).to have_field('password')
    expect(page).to have_button('Sign in')
  end

  scenario 'existing user is able to sign in' do
    User.create(name: 'Test', username: 'MrTest', email: 'test@test.uk', password: 'Testy', password_confirmation: 'Testy')
    visit('/users/sign_in')
    fill_in(:username_or_email, with: 'MrTest')
    fill_in(:password, with: 'Testy')
    click_button('Sign in')
    expect(page.current_url.ends_in?('/peeps')).to be(true)
    expect(page).to have_content('Welcome MrTest!')
  end

  scenario 'Unable to sign in if passed an incorrect password' do
    User.create(name: 'Test', username: 'MrTest', email: 'test@test.uk', password: 'Testy', password_confirmation: 'Testy')
    visit('/users/sign_in')
    fill_in(:username_or_email, with: 'MrTest')
    fill_in(:password, with: 'WrongPassword')
    click_button('Sign in')
    expect(page.current_url.ends_in?('/users/sign_in')).to be(true)
    expect(page).to have_content('Incorrect password')
  end
end
