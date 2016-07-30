# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature 'Sign up' do
  scenario 'User can sign up to Chitter' do
    visit '/session/new'
    fill_in 'enter_name', with: 'Mannie'
    fill_in 'username', with: 'mannieg'
    fill_in 'email', with: 'mannieg@googlemail.com'
    fill_in 'password', with: 'Password123'
    fill_in 'password_confirm', with: 'Password123'
    click_button 'Sign up'
    expect(page).to have_content 'Welcome to Chitter Mannie'
  end
end
