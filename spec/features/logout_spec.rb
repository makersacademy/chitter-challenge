feature 'Users log out' do
  before do
    sign_up(email: 'pug@gmail.com', name: 'Pug', username: '@puggy',
     password: 'password', password_confirmation: 'password')
  end

  scenario 'while being logged in' do
    log_in(email: 'pug@gmail.com', password: 'password')
    click_button 'Log out'
    expect(page).to have_content 'goodbye!'
    expect(page).not_to have_content 'Welcome pug@gmail.com'
  end
end
