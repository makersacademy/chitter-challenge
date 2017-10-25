feature 'Logging out of Chitter' do
  
  before do
    User.create(name: 'Ainsley', email: 'no@email.com', password: 'password', handle: '#ainsley')
  end

  scenario 'I can log out of Chitter' do
    visit '/'
    fill_in :email, with: 'no@email.com'
    fill_in :password, with: 'password'
    click_button 'Log in'
    click_button 'Log out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, Ainsley')
  end

end
