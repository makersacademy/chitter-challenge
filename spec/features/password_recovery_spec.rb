require_relative 'web_helper'

feature 'Resetting Password' do

  before do
   sign_up
   click_button 'Create account'
   Capybara.reset!
 end
 let(:user) { User.first }

 scenario 'When I forget my password I can see a link to reset' do
   visit '/sessions/new'
   click_link 'I forgot my password'
   expect(page).to have_content("Please enter your email address")
 end

 scenario 'When I enter my email I am told to check my inbox' do
   recover_password
   expect(page).to have_content "Thanks, Please check your inbox for the link."
 end

  scenario 'assigned a reset token to the user when they recover' do
    expect{recover_password}.to change{user.password_token}
  end

  scenario 'it doesn\'t allow you to use the token after an hour' do
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
     sign_in(password: "newpassword")
     expect(page).to have_content "Welcome, TestUser1"
   end

end
