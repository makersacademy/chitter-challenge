feature 'resetting password' do
  before do
    sign_up
    Capybara.reset!
  end

  let(:user) { User.first }

  scenario 'when user has forgotten password they can request a reset' do
    visit '/sessions/new'
    click_link 'I forgot my password'
    expect(page).to have_content("Please enter your email address")
  end

  scenario 'when user enters email address, they are told to check inbox' do
    recover_password
    expect(page).to have_content "Please check your inbox to set a new password."
  end

  scenario 'assigns a reset token to the user when they recover' do
    recover_password
    expect(user.password_token).not_to eq nil
  end
#
#   scenario 'it doesn\'t allow you to use the token after an hour' do
#     recover_password
#     Timecop.travel(60 * 60 * 60) do
#       visit("/users/reset_password?token=#{user.password_token}")
#       expect(page).to have_content "Your token is invalid"
#     end
#   end
#
#   scenario 'it asks for your new password when your token is valid' do
#      recover_password
#      visit("/users/reset_password?token=#{user.password_token}")
#      expect(page).to have_content("Please enter your new password")
#   end
end
