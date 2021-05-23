feature 'logging in' do
  scenario 'an existing user is logged in' do
    register_new_user
    click_button('Logout')
    visit('/login')
    expect(current_path).to eq('/login')
    fill_in(:email, with: 'bob@bob.com')
    fill_in(:password, with: 'password')
    click_button('Login')
    expect(page).not_to have_content('Login')
  end
end
