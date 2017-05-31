feature 'User signs out' do

  before(:each) do
    User.create(email: 'hello@hello.org',
                password: 'hello1',
                password_confirmation: 'hello1')
  end

  scenario 'while being signed in' do
    sign_in(email: 'hello@hello.org', password: 'hello1')
    click_button 'Sign out'
    expect(page).to have_content('You have signed out of Chitter!')
    expect(page).not_to have_content('Welcome, hello@hello.org')
  end

end
