feature 'Log out' do
  scenario 'logged in user can log out' do
    sign_up('Peter Pan', 'peterpan', 'peter@neverland.com', 'password')
    click_on 'Log Out'

    expect(current_path).to eq '/'
    expect(page).to have_selector(:link_or_button, 'Sign Up')
    expect(page).to have_selector(:link_or_button, 'Log In')
    expect(page).not_to have_selector(:link_or_button, 'Log Out')
    expect(page).not_to have_content 'peterpan'
  end
end
