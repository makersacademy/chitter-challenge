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
    expect(page).to have_content 'fakeuser'
  end
end
