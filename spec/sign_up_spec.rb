feature 'Sign up' do
  scenario 'I want to be able to sign up to Chitter' do
    visit '/register'
    fill_in 'username', with: 'FrodoSwaggins'
    fill_in 'firstname', with: 'Frodo'
    fill_in 'lastname', with: 'Baggins'
    fill_in 'email', with: 'the1ring@gmail.com'
    fill_in 'password', with: 'ilovetheshire'
    click_button 'Register'
    expect(page).to have_content 'You are now signed in as FrodoSwaggins'
  end
end
