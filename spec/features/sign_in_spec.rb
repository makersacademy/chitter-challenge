feature 'User logs in' do
  
  before(:each) do
    User.create(email: 'ilya.faybisovich@gmail.com',
                username: 'ilyafaybisovich',
                password: 'applecider',
                password_confirmation: 'applecider')
  end

  
  scenario 'with correct credentials' do
    visit '/'
    expect(page).not_to have_content('Welcome, ilya.faybisovich@gmail.com')
    sign_in('ilyafaybisovich', 'applecider')
    expect(page).to have_content('Welcome, ilya.faybisovich@gmail.com')
  end

  scenario 'with incorrect credentials' do
    visit '/'
    expect(page).not_to have_content('Welcome, ilya.faybisovich@gmail.com')
    sign_in('ilyafaybisovich', 'wrong')
    expect(page).not_to have_content('Welcome, ilya.faybisovich@gmail.com')
  end

  def sign_in(username, password)
    visit '/sessions/new'
    fill_in 'username', with: username
    fill_in 'password', with: password
    click_button 'Sign in'
  end

end
