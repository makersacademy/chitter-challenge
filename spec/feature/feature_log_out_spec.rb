# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature "sign_out" do
  scenario "user can sign out" do
    sign_in
    click_button 'Sign out'
    expect(page).not_to have_content "Username: Nat-Nat"
  end
end
