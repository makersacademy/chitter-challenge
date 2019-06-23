feature '## User can sign up to Chitter' do
  scenario 'User signs up to Chitter...' do
    visit '/timeline'
    click_link 'Sign up'
    expect(page).to have_content('Welcome to the cool club')
    
    fill_in 'email', with: 'testaccount@gmail.com'
    fill_in 'name', with: 'Remy'
    fill_in 'username', with: 'Remzilla'
    fill_in 'password', with: 'password1'
    click_button 'sign up'

    expect(page).to have_content('logged in as: Remzilla')
  end
end