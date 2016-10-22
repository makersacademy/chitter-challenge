feature 'Log in' do
  scenario 'A logged out user can see a "log in" button on the homepage' do
    visit '/'
    expect(page).to have_selector(:link_or_button, 'Log in')
  end
end

feature 'Log in' do
  scenario 'A logged out user can create a new user account' do
    visit '/signup'
    fill_in 'name', with: 'Posie'
    fill_in 'email', with: 'posie@slack.com'
    fill_in 'username', with: 'rgoll'
    fill_in 'password', with: '1234apple$'
    click_button 'Create account'
    expect(User.count).to eq 1
  end
end
