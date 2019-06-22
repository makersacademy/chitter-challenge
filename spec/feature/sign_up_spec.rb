feature '## User can sign up to Chitter' do
  scenario 'User signs up to Chitter...' do
    visit '/'
    click_link 'Sign up'
    expect(page).to have_content('Sign up to Chitter!')
    
    fill_in 'email', with: 'testaccount@gmail.com'
    fill_in 'name', with: 'Remy'
    fill_in 'username', with: 'Remzilla'
    fill_in 'password', with: 'password1'
    click_button 'sign up'

    expect(page).to have_content('logged in as: Remzilla')
  end
end