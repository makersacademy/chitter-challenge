feature 'Sign-out' do
  scenario 'the user can sign out' do
    sign_up
    click_button "Log Out"
    expect(page).not_to have_content "Welcome Robert"
  end
end
