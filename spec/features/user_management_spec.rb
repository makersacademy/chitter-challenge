require_relative '../web_helpers'

feature 'User management' do

  before do
    sign_up(username: 'Ryan')
  end

  scenario 'I can sign up as a new user' do
    expect(page).to have_content('Welcome, Ryan')
  end

  scenario 'I can log out once signed up' do
    click_on 'Log out'
    expect(page).not_to have_content('Welcome, Ryan')
  end

  scenario 'I can log in once signed up' do
    click_on 'Log out'
    click_on 'Log in'
    fill_in 'email', with: 'ryan@aol.com'
    fill_in 'password', with: 'password'
    within '.log-in-form' do
      click_on 'Log in'
    end
    expect(page).to have_content('Welcome, Ryan')
  end

end
