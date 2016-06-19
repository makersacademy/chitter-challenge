feature 'logging in' do
  scenario 'user can access log in page from homepage' do
    visit('/peeps')
    click_button 'Log in'
    expect(page).to have_content('Log in to Chitter')
  end

  scenario 'user logs in' do
    sign_up(username: 'Batman', email: 'bruce@wayne.com', password: 'loverobin', password_confirmation: 'loverobin')
    log_in(username:'Batman', password: 'loverobin')
    expect(page).to have_content 'Welcome, Batman!'
  end
end