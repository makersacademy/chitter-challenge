feature 'Sign out --' do
  let!(:user) do
    User.create(username:'Batman',
                email:'cleo@email.com',
                password:'password1')
    end

  scenario  'User should be able to sign out' do
    sign_in
    click_button 'Sign out'
    expect(page).to have_content('Welcome to Chitter')
    expect(page).not_to have_content('Welcome, Batman')
  end
end
