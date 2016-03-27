feature 'User management -log in:' do

  scenario 'User can log in with correct credsentials' do
    sign_up
    log_in
    expect(current_path).to eq('/home')
    expect(page).to have_content('Welcome to Chitter, jinis!')
  end

  scenario 'User can\'t log in with incorrect password' do
    sign_up
    log_in(password: 'wrong')
    expect(current_path).to eq('/sessions/new')
    expect(page).to have_content('Incorrect email or password')
  end

  scenario 'User can jump to sign up page' do
    visit('/sessions')
    click_button('Sign up here')
    expect(current_path).to eq('/users/new')
  end
end
