# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign Up' do
  scenario 'A user can sign up for a Chitter account' do
      visit '/'
      fill_in(:email, with: 'test@example.com')
      fill_in(:password, with: 'password123')
      fill_in(:name, with: 'Joe Bloggs')
      fill_in(:username, with: 'JBloggs')
      click_button('Sign Up')

      expect(page).to have_content "Welcome Joe Bloggs"
    end
  end
