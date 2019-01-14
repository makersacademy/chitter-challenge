feature 'Post Message' do
  let!(:user) { User.create(
    name: 'Socks',
    username: 'awesome',
    email: 'socks@socks.com',
    password: 'Secret'
  ) }
  scenario 'User can post a message' do
    visit '/'
    fill_in :signin_username, with: 'awesome'
    fill_in :signin_password, with: 'Secret'
    click_button 'Log In'

    expect(page).to have_content('Chitter')
    
    fill_in :message, with: 'This is a test peep'
    click_button 'Enter'
  end

end
