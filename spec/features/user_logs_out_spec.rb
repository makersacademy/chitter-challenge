feature 'User signs out' do

  before(:each) do
    User.create(name: 'test',
                username: 'tt',
                email: 'test@test.com',
                password: 'test')
  end

  scenario 'while being signed in' do
    sign_in(email: 'test@test.com', password: 'test')
    click_button 'Log Out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end
