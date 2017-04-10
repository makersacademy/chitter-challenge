feature 'User sign out' do

  before do
    User.create(email: 'hello@goobye.com', name: 'Bill', username: 'biggbill', password: 'cheese123', password_confirmation: 'cheese123')
  end

  scenario 'While signed in' do
    sign_in(email: 'hello@goobye.com', password: 'cheese123')
    click_button('Sign out')
    expect(page).to have_content('You are now logged out. Goodbye!')
    expect(page).not_to have_content('Welcome, hello@goodbye.com')
  end

end
