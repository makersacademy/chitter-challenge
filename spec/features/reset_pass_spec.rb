feature 'resetting password' do

  before do
    sign_up('timmy', 'timmy@hello.com')
    Capybara.reset!
  end

  scenario 'when user forgets password they can click a link to reset' do
    visit '/sessions/new'
    click_link 'Forgot password?'
    expect(page).to have_content("Please enter your email address")
  end

  scenario 'after entering email address, user is told to check inbox' do
    recover_password
    expect(page).to have_content ("Thanks, please check your inbox.")
  end

  scenario 'user is assigned a reset token when they ask for password recovery' do
    recover_password
    expect { recover_password }.to change { User.first.password_token }
  end

  scenario 'it does not allow you to use the token after an hour' do
    recover_password
    Timecop.travel(60 * 60 * 60) do
      visit("/users/reset_password?token=#{User.first.password_token}")
      expect(page).to have_content "Your token is invalid"
    end
  end

  scenario 'it asks for new password when token is valid' do
    recover_password
    visit("/users/reset_password?token=#{User.first.password_token}")
    expect(page).to have_content "Please enter your new password"
  end

  scenario 'it lets you enter a new password with a valid token' do
    recover_password
    reset_password("newpassword", "newpassword")
    expect(page).to have_content("Forgot password?")
  end

  scenario 'it lets you sign in after password reset' do
    recover_password
    reset_password("newpassword", "newpassword")
    login("newpassword")
    expect(page).to have_content "Hello, timmy!"
  end

  scenario 'it lets you know if your passwords do not match' do
    recover_password
    reset_password("newpassword", "wrongpassword")
    expect(page).to have_content "Password does not match the confirmation"
  end
end
