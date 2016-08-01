feature 'Resetting Password' do

  before do
    sign_up
    Capybara.reset!
    allow(SendEmail).to receive(:call)
  end
  let(:user) { User.first }

  scenario "There is a link to reset forgotten passwords" do
    visit '/sessions/new'
    click_link 'Forgotten password'
    expect(page).to have_content("Please enter your email address")
  end

  scenario "Displays message check your inbox" do
    recover_password
    expect(page).to have_content "Thank you, a link has been sent to you inbox"
  end

  scenario "assigned a reset token to the user when they recover" do
    expect{recover_password}.to change{User.first.password_token}
  end

  scenario "token is invalid after an hour" do
    recover_password
    Timecop.travel(60 * 60 * 60) do
      visit("/users/reset_password?token=#{user.password_token}")
      expect(page).to have_content "Your token is invalid"
    end
  end

  scenario "with valid token it asks for new password" do
    recover_password
    visit("/users/reset_password?token=#{user.password_token}")
    expect(page).to have_content("Please enter your new password")
  end

  scenario "with a valid token you can enter a new password" do
    new_password
    expect(page).to have_content("Please sign in")
  end

  scenario "you can sign in with a new password" do
    new_password
    sign_in(user_name: "CONDOTH1", password: "newpword")
    expect(page).to have_content "Welcome, CONDOTH1"
  end

  scenario "you advised if the passwords don't match" do
    recover_password
    visit("/users/reset_password?token=#{user.password_token}")
    fill_in :password, with: "newpword"
    fill_in :password_confirmation, with: "wrongpword"
    click_button "Submit"
    expect(page).to have_content("Password does not match the confirmation")
  end

  scenario "it resets the token immediately after new password set" do
    new_password
    visit("/users/reset_password?token=#{user.password_token}")
    expect(page).to have_content("Your token is invalid")
  end

  scenario "it calls the SendRecoverLink service to send the link" do
    expect(SendEmail).to receive(:call).with(user)
    recover_password
  end
end
