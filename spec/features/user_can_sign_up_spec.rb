feature 'sign up' do
  scenario 'user is redirected to the registration page' do
    visit '/'
    click_button 'Sign Up'
    expect(current_path).to eq '/users/register'
  end

  scenario 'user is prompted to provide username, email and password' do
    visit '/users/register'
    expect(page).to have_content 'Username'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
    expect(page).to have_button 'Register'
  end

  scenario 'user is redirected to homepage after sign up' do
    register
    expect(current_path).to eq '/'
  end

  scenario 'user sees username on homepage after sign up' do
    register
    expect(page).to have_content 'fakeuser'
  end

  scenario 'user no longer sees links to sign up or login' do
    register
    expect(page).not_to have_content 'Sign Up'
    expect(page).not_to have_content 'Login'
  end

  scenario 'user can go to the login page' do
    visit '/users/register'
    click_button 'Login'
    expect(current_path).to eq '/sessions/login'
  end

  scenario 'user can go back to homepage' do
    visit '/users/register'
    click_button 'Go Back'
    expect(current_path).to eq '/'
  end
end
