feature 'Chitter' do
  scenario 'user can sign up' do
    visit('login')
    fill_in('login', with: "Ilja")
    fill_in('password', with: '123456')
    fill_in('e-mail', with: 'beck@tts.lt')
    click_button('Signup')
    expect(page).to have_content('Welcome to Chitter, Ilja!')
  end
  scenario 'registered user can login' do
    visit('login')
    fill_in('login', with: "Ilja")
    fill_in('password', with: '123456')
    click_button('Login')
    expect(page).to have_content('Welcome back, Ilja!')
  end
  scenario 'registered user can logout' do
    visit('login')
    fill_in('login', with: "Ilja")
    fill_in('password', with: '123456')
    click_button('Logout')
    expect(page).not_to have_content('Welcome back, Ilja!')
  end
end
