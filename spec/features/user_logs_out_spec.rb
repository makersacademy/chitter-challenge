feature 'User signs out' do

  before(:each) do
    User.create(name: 'test',
                username: 'tt',
                email: 'ana@great.com',
                password: 'apples')
  end

  scenario 'while being signed in' do
    visit '/sessions/new'
    fill_in :email, with: 'ana@great.com'
    fill_in :password, with: 'apples'
    click_button 'Log In'
    click_button 'Log Out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, ana@great.com')
  end

end
