feature 'log out' do
  scenario 'logged in user can log out from homepage' do
    sign_up
    click_button('Log out')

    expect(current_path).to eq('/')
    expect(page).to have_content('Logged out succesfully.')
  end
end