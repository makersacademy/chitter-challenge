feature 'Resetting password' do

  before(:each) do
    User.create(email: 'ruan@example.com',
                password: 's3cr3t',
                password_confirmation: 's3cr3t',
                name: 'Ruan',
                user_name: 'ruanodendaal')
    Capybara.reset!
  end
  let(:user) { User.first }

  scenario 'password reset link' do
    visit 'sessions/new'
    click_link 'Forgot password'
    expect(page).to have_content 'Please enter your email address'
  end

  scenario 'When I enter my email I am told to check my inbox' do
   recover_password
   expect(page).to have_content 'Thanks, check your inbox for the link'
 end

  scenario 'assigned a reset token to the user when they recover' do
    expect{ recover_password }.to change{User.first.password_token}
  end

  scenario "it doesn't allow you to use the token after an hour" do
    recover_password
    Timecop.travel(60 * 60 * 60) do
      visit("/users/reset_password?token=#{user.password_token}")
      expect(page).to have_content "Your token is invalid"
    end
  end

  scenario 'it asks for your new password when your token is valid' do
   recover_password
   visit("/users/reset_password?token=#{user.password_token}")
   expect(page).to have_content("Please enter your new password")
 end

  scenario 'it lets you enter a new password with a valid token' do
    recover_password
    visit("/users/reset_password?token=#{user.password_token}")
    fill_in :password, with: "newpassword"
    fill_in :password_confirmation, with: "newpassword"
    click_button "Submit"
    expect(page).to have_content("Please sign in")
  end

  scenario 'it lets you sign in after password reset' do
    recover_password
    visit("/users/reset_password?token=#{user.password_token}")
    fill_in :password, with: "newpassword"
    fill_in :password_confirmation, with: "newpassword"
    click_button "Submit"
    sign_in(email: 'ruan@example.com', password: "newpassword")
    expect(page).to have_content "Welcome, ruanodendaal"
  end

  scenario "it lets you know if your passwords don't match" do
    recover_password
    visit("/users/reset_password?token=#{user.password_token}")
    fill_in :password, with: "newpassword"
    fill_in :password_confirmation, with: "wrongpassword"
    click_button "Submit"
    expect(page).to have_content("Password does not match the confirmation")
  end

  scenario 'it immediately resets token upon successful password update' do
    recover_password
    set_password(password: "newpassword", password_confirmation: "newpassword")
    visit("/users/reset_password?token=#{user.password_token}")
    expect(page).to have_content("Your token is invalid")
  end
end
