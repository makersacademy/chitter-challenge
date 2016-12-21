require 'timecop'

feature "Password Recovery" do

  before do
    sign_up
    Capybara.reset!
    allow(SendEmail).to receive(:call)
  end

  let(:user) { User.first(email: "tester1@test.com") }

  scenario "User can request to recover their password" do
    visit '/'
    expect(page).to have_content ("Forgotten Password?")
  end

  scenario "Directs the user to password recovery page" do
    visit '/'
    click_link("Forgotten Password?")
    expect(current_path).to eq '/users/password-recovery'
    expect(page).to have_content ("Enter Email")
  end

  scenario "Shows message when email has been entered" do
    recover_password
    expect(page).to have_content ("Please check your emails for further instructions")
  end

  scenario "Generates a password token on recovery request" do
    expect{recover_password}.to change{User.first.password_token}
  end

  scenario "It doesn't let you reset your password after an hour" do
    recover_password
    Timecop.travel(Time.now + 3601) do
      visit "/users/reset_password?token=#{user.password_token}"
      expect(page).to have_content "Token invalid"
    end
  end

  scenario "It does let you reset your password before an hour" do
    recover_password
    visit "/users/reset_password?token=#{user.password_token}"
    expect(page).to have_content "Please enter your new password"
  end

  scenario "User can enter their new password in" do
    recover_password
    visit "/users/reset_password?token=#{user.password_token}"
    fill_in :password, with: "newpassword"
    fill_in :password_confirmation, with: "newpassword"
    click_button "Submit"
    expect(page).to have_content "Sign In!"
  end

  scenario "User can log in with new password" do
    recover_password
    visit "/users/reset_password?token=#{user.password_token}"
    fill_in :password, with: "newpassword"
    fill_in :password_confirmation, with: "newpassword"
    click_button "Submit"

    fill_in :email, with: 'tester1@test.com'
    fill_in :password, with: 'newpassword'
    click_button "Sign In"
    expect(page).to have_content "Welcome, Tester"
  end

  scenario "Password recovery token expires after use" do
    recover_password
    visit "/users/reset_password?token=#{user.password_token}"
    fill_in :password, with: "newpassword"
    fill_in :password_confirmation, with: "newpassword"
    click_button "Submit"
    expect(User.first.password_token).to eq nil
  end

  scenario "User is sent an email when they recover password" do
    expect(SendEmail).to receive(:call).with(user)
    recover_password
  end

end
