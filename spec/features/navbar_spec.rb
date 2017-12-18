feature 'Navbar' do
  scenario 'Should display login button when user is not logged in' do
    visit '/posts'
    expect(page).to have_content "Login"
  end
  scenario 'Should display logout button when user is logged in' do
    register_account
    visit '/posts'
    expect(page).to have_button "Logout"
  end
  scenario 'Should not display signed in as when not logged in' do
    visit '/posts'
    expect(page).to_not have_content "Signed in as"
  end
end
