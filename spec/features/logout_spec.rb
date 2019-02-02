# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'users can logout' do

  scenario 'logout button clears user session' do
    visit_site_and_click_sign_up
    fill_in_signup_form
    expect(page).to have_content 'Welcome, Ivan the Terrible'
    expect(page).to_not have_button('Login')
    expect(page).to_not have_button('Sign Up')
    click_button 'Logout'
    expect(page).to_not have_content 'Welcome, Ivan the Terrible'
    expect(page).to have_button('Login')
    expect(page).to have_button('Sign Up')
    expect(page).to have_content 'You have logged out.'
  end
end