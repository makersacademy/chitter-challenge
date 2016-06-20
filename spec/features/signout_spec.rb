feature 'User signs out' do

  before(:each) do
    User.create(email: 'test@test.com',
                name: 'test',
                username: 'testing',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'while being signed in' do
    signin(email: 'test@test.com', password: 'test')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end