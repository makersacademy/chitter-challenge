# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'users can sign up to Chitter' do

  scenario 'the signup button works' do
    visit_site_and_click_sign_up
    fill_in_signup_form
    expect(page).to have_content 'Welcome, Ivan the Terrible. You are logged in.'
  end

end