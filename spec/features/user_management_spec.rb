require_relative 'helpers'

feature 'User management' do
  include Helpers

  before do
    sign_up(username: 'Ryan', email: 'ryan@ryan.com')
  end

  scenario 'I can sign up as a new user' do
    expect(page).to have_content('Welcome, Ryan')
  end

  scenario 'A user cannot create a profile with an exiting username' do
    sign_up(username: 'Ryan', email: 'ryan2@ryan.com')
    expect(page).to have_content "Invalid login"
  end

  scenario 'A user cannot create a profile with an exiting email' do
    sign_up(username: 'Ryan2', email: 'ryan@ryan.com')
    expect(page).to have_content "Invalid login"
  end

  scenario 'I can log out once signed up' do
    click_on 'Log out'
    expect(page).not_to have_content('Welcome, Ryan')
  end

  scenario 'I see peeps if not logged in' do
    post_peep(peep_content: "Testing peeps")
    click_on 'Log out'
    visit '/peeps'
    expect(page).to have_content("Testing peeps")
  end

  scenario 'I can log in once signed up' do
    click_on 'Log out'
    within ".welcome" do
      click_on 'Log in'
    end
    fill_in 'email', with: 'ryan@ryan.com'
    fill_in 'password', with: 'password'
    within '.log-in-form' do
      click_on 'Log in'
    end
    expect(page).to have_content('Welcome, Ryan')
  end

  scenario 'As a loggin in user I can visit my profile page' do
    click_on 'Welcome, Ryan'
    expect(page).to have_content 'Profile' and have_content 'Username: Ryan'
  end

end
