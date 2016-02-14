# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'login' do

  before do
    signup
  end

  scenario 'A user can sign in with valid credentials' do
    visit '/sessions/new'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'abcd'
    click_button 'Login'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome, Bobby'
  end

  scenario 'A user cannot sign in with invalid password' do
    visit '/sessions/new'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: '1234'
    click_button 'Login'
    expect(current_path).to eq '/sessions'
    expect(page).to have_content 'The email or password is incorrect Login E-mail Password'
  end

  scenario 'A user cannot sign in with invalid email' do
    visit '/sessions/new'
    fill_in 'email', with: 'live@test.com'
    fill_in 'password', with: 'abcd'
    click_button 'Login'
    expect(current_path).to eq '/sessions'
    expect(page).to have_content 'The email or password is incorrect Login E-mail Password'
  end
end
