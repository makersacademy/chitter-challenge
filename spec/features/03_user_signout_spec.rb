# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature '03. A user can sign out' do
  scenario 'When user clicks the button sign out message is displayed' do
    user_signup
    user_signin
    click_button('Sign out')
    expect(page).to have_text("Goodbye!")
  end
end
