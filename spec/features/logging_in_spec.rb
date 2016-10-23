feature 'Log in' do
  scenario 'A logged out user can see "log in" and "sign up" button on the homepage' do
    visit '/'
    expect(page).to have_selector(:link_or_button, 'Log in')
    expect(page).to have_selector(:link_or_button, 'Sign up')
  end
end

feature 'Log in' do
  scenario 'A logged out user can create a new user account' do
    create_account
    expect(User.count).to eq 1
  end
end
