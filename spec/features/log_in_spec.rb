feature do

  before do
    User.add(username: 'Becka', email: 'notarealemail12345@hotmail.co.uk', password: 'fakepassword')
  end

  scenario 'succesfully logs in to homepage' do
    sign_in
    expect(page).to have_content 'Welcome back to chitter, Becka'
  end

  scenario 'unsuccessful attempt to log in to homepage' do
    sign_in(wrong_password = true)
    expect(page).to have_content 'Log in unsuccessful'
  end

  scenario 'logs in and logs out' do
    sign_in
    click_on 'log out'
    expect(page).not_to have_content 'Welcome back to chitter, Becka'
    expect(page).to have_content 'Welcome to chitter'
  end

  def sign_in(wrong_password = false)
    visit '/'
    fill_in 'username', with: 'Becka'
    password = wrong_password ? 'wrongpassword' : 'fakepassword'
    fill_in 'password', with: password
    click_on 'log in'
  end

end
