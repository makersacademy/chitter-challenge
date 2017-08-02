require_relative 'helpers'

feature 'User management' do
  include Helpers

  subject(:user)    { described_class }
  let(:full_name)   { "Ryan"          }
  let(:email)       { 'ryan@ryan.com' }
  let(:username)    { 'ryan'          }
  let(:password)    { 'password'      }
  let(:password2)   { 'password2'     }
  let(:full_name2)  { "Ryan2"         }
  let(:email2)      { 'ryan@ryan.com' }
  let(:username2)   { 'ryan'          }

  let(:expected_date) { DateTime.now  }

  before  { Timecop.freeze }
  after   { Timecop.return }

  before do
    sign_up(username: username, email: email)
  end

  scenario 'I can sign up as a new user' do
    expect(page).to have_content('Welcome, ' + username)
  end

  scenario 'A user cannot create a profile with an exiting username' do
    sign_up(username: username, email: email)
    expect(page).to have_content "Invalid login"
  end

  scenario 'A user cannot create a profile with an existing email' do
    sign_up(username: username2, email: email)
    expect(page).to have_content "Invalid login"
  end

  scenario 'I can log out once signed up' do
    click_on 'Log out'
    expect(page).not_to have_content('Welcome, ' + username)
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
    fill_in 'email', with: email
    fill_in 'password', with: password
    within '.log-in-form' do
      click_on 'Log in'
    end
    expect(page).to have_content('Welcome, ' + username)
  end

  scenario 'As a loggin in user I can visit my profile page' do
    click_on 'Welcome, ' + username
    expect(page).to have_content 'Profile' and have_content 'Username: ' + username
  end

end
