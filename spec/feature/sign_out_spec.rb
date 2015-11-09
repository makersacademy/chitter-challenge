# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'User sign out' do

  before(:each) do
    User.create(email: 'hello@hello.com',
                password: 'abcd',
                password_confirmation: 'abcd')
  end

  scenario 'while being signed in' do
    sign_in(email: 'hello@hello.com', password: 'abcd')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, hello@hello.com')
  end

  def sign_in(email:, password:)
    visit '/signin/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button('Sign in')
  end
  
end
