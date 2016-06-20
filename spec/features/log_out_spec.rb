feature 'loggin out' do
  before(:each) do User.create(username: 'Batman', email: 'bruce@wayne.com', password: 'loverobin', password_confirmation: 'loverobin')
  end

  scenario 'while being signed in' do
    log_in(username: 'Batman', password: 'loverobin')
    click_button 'Log out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content 'Welcome, Batman!'
  end

end

