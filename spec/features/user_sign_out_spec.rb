feature 'User signs out' do
  
  before(:each) do
    User.create(name: 'banana man',
                email: 'banana@example.com', 
                username: 'bananaman1',
                password: 'banana123', 
                password_confirmation: 'banana123'
                )
  end

  scenario 'while being signed in' do
    sign_in(username: 'bananaman1', password: 'banana123')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, bananaman1')
  end

   def sign_in(username:,
          password:)
    visit '/sessions/new'
    fill_in :username, with: username
    fill_in :password, with: password
    click_button 'Sign in'
  end
  #move into helper module

end