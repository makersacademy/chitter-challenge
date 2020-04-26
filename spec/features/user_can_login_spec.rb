feature 'login' do
  scenario 'user is redirected to the login page' do
    visit '/'
    click_button 'Login'
    expect(current_path).to eq '/login'
  end

  scenario 'user is prompted to provide email and password' do
    visit '/login'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
    expect(page).to have_button 'Login'
  end

  scenario 'user is redirected to homepage after login' do
    login
    expect(current_path).to eq '/'
  end

  scenario 'user sees username on homepage after login' do
    login
    expect(page).to have_content 'Welcome to Chitter, fakeuser!'
  end

  scenario 'user no longer sees links to sign up or login' do
    login
    expect(page).not_to have_content 'Sign Up'
    expect(page).not_to have_content 'Login'
  end

  scenario 'user is not logged in if email is incorrect' do
    register
    click_button 'Log Out'
    click_button 'Login'
    fill_in 'Email', with: 'imposter@imposter.com'
    fill_in 'Password', with: 'password'
    click_button 'Login'
    expect(page).not_to have_content 'Welcome to Chitter, fakeuser!'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'user is not logged in if password is incorrect' do
    register
    click_button 'Log Out'
    click_button 'Login'
    fill_in 'Email', with: 'fake@fake.com'
    fill_in 'Password', with: 'wrongpassword'
    click_button 'Login'
    expect(page).not_to have_content 'Welcome to Chitter, fakeuser!'
    expect(page).to have_content 'Please check your email or password.'
  end
end
