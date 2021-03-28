feature 'Sign out' do
  scenario 'Only signed in users can press sign out' do
    visit('/')
    expect(page).not_to have_button("Sign out")
  end
  scenario 'A signed in user presses sign out' do
    sign_in
    click_button "Sign out"
    expect(page).to have_content("Welcome to Chitter!")
  end
end
