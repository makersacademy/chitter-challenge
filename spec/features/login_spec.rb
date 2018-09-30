feature 'Login process' do
  scenario 'user logs in successfully' do
    visit 'users/login'
    fill_in 'email', with: 'test@email.com'
    fill_in 'password', with: 'password'
    click_button('Log in')
    expect(current_path).to eq '/users/welcome'
    expect(page).to have_content 'Welcome to Chitter, test@email.com'
  end
  scenario 'user enters wrong password' do
    visit 'users/login'
    fill_in 'email', with: 'test@email.com'
    fill_in 'password', with: 'wrong password'
    click_button('Log in')
    expect(current_path).to eq '/users/login'
    expect(page).to have_content 'Wrong password'
  end
  scenario 'user account does not exist' do
    visit 'users/login'
    fill_in 'email', with: 'not_existent@email.com'
    fill_in 'password', with: 'password'
    click_button('Log in')
    expect(current_path).to eq '/users/login'
    expect(page).to have_content 'User does not exist'
  end
end
