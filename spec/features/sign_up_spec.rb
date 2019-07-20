# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign up' do
  scenario 'A user can sign up with email address and password ' do
    visit('/')
    click_button('Sign up')
    fill_in('username', with: "will")
    fill_in('email', with: "test@example.com")
    fill_in('password', with: "1234")
    click_button('Submit')
    expect(page).to have_content("Registration successful")
  end
end
