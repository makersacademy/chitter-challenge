feature 'user can log in' do

  before(:each) do
    create_user_alice
  end

  scenario 'user can log in' do
    log_in(email:'alice@example.com', password: 'orange')
    expect(page).to have_content('Welcome, Alice')
  end

  scenario 'user cannot log in with with incorrect password' do
    log_in(email:'alice@example.com', password: 'apple')
    expect(page).not_to have_content('Welcome, Alice')
    expect(page).to have_content 'The email or password is incorrect'
  end

end