require_relative './web_helpers'
feature 'Log in' do
  scenario 'It allows the user to log in' do
    visit('/')
    click_button 'Log in'
    expect(page).to have_field('email')
    expect(page).to have_field('password')
  end

  scenario 'Greets user when logged in' do
    visit('/')
    sign_up
    fill_in('email', with: 'lucy@email.com')
    fill_in('password', with: 'Password123')
    click_button 'Log in'
    expect(page).to have_content('Welcome Lucy Barber')
  end
end
