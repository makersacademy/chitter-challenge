feature 'sign out of chitter' do
  scenario 'can sign out' do
    visit '/'
    click_button 'Sign in'
    fill_in(:email, with: 'admin@chitter.com')
    fill_in(:password, with: 'password1234')
    click_button 'Sign in'
    click_button 'Sign out'
    expect(page).to have_content('You have signed out.')
  end
end
