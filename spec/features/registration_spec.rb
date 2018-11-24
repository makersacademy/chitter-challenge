feature 'registration' do
  scenario 'a user can get to the registration page' do
    visit '/'
    click_button('Register for Chitter')

    expect(page).to have_content 'Registration'
  end

  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('name', with: 'Glow Cloud')
    fill_in('user_name', with: 'GlowCloud')
    fill_in('email', with: 'glowcloud@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content "Welcome to Chitter, Glow Cloud"
  end
end
