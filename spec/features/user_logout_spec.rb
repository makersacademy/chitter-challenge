feature 'user signs out' do

  before(:each) do
    User.create(email: 'kavita@example.com',
                password: 'makers',
                password_confirmation: 'makers',
                name: 'Kavita',
                username: 'kkavita92')
  end

  scenario 'while being signed in' do
    log_in(email: 'kavita@example.com', password: 'makers')
    click_button 'Log out'
    expect(page).to have_content('See you again!')
    expect(page).not_to have_content('Welcome, Kavita')
  end

end
