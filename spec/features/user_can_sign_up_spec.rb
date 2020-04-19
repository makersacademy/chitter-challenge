feature 'sign up' do
  scenario 'user is redirected to the registration page' do
    visit '/'
    click_button 'Sign Up'
    expect(current_path).to eq '/register'
  end

  scenario 'user is prompted to provide username, email and password' do
    visit '/register'
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
end
