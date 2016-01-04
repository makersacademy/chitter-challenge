
feature 'password can be reset' do

  before do
    sign_up
    Capybara.reset!
    allow(SendRecoverLink).to receive(:call)
  end

  let(:user) { User.first }

  scenario 'users can click "forgotten password" link' do
    visit '/sessions/new'
    click_link 'Forgotten password?'
    expect(page).to have_content "Please enter your email address"
  end

  scenario 'users can enter email address' do
    recover_password
    expect(page).to have_content 'Thank you, please check your inbox'
  end

  scenario 'users receive a reset token on sign up' do
    expect{recover_password}.to change {User.first.password_token}
  end

  scenario 'tokens expire after an hour' do
    recover_password
    Timecop.travel(60*60*60) do
      visit("/users/reset_password?token=#{user.password_token}")
      expect(page).to have_content "Your token has expired"
    end
  end

  scenario 'user may reset passwords' do
    recover_password
    visit("/users/reset_password?token=#{user.password_token}")
    expect(page).to have_content "Please enter your new password"
    end

  scenario 'with a valid token, user may reset password' do
    recover_password
    visit("/users/reset_password?token=#{user.password_token}")
    fill_in  :password, with: "newpassword"
    fill_in :password_confirmation, with: "newpassword"
    click_button "Submit"
    expect(page).to have_content "Sign in to Chitter"
  end


  scenario 'it lets you sign in after password reset' do
     recover_password
     visit("/users/reset_password?token=#{user.password_token}")
     fill_in :password, with: "newpassword"
     fill_in :password_confirmation, with: "newpassword"
     click_button "Submit"
     sign_in(email: "edwardkerry@gmail.com", password: "newpassword")
     expect(page).to have_content "Edward's Chitter!"
   end

  scenario 'it lets you know if passwords don\'t match' do
     recover_password
     visit("/users/reset_password?token=#{user.password_token}")
     fill_in :password, with: "newpassword"
     fill_in :password_confirmation, with: "wrongpassword"
     click_button "Submit"
     expect(page).to have_content("Password does not match the confirmation")
   end

   scenario 'it calls the SendRecoveryLink service to send the link' do
    expect(SendRecoverLink).to receive(:call).with(user)
    recover_password
  end

  def recover_password
    visit '/users/recover'
    fill_in :email, with: "edwardkerry@gmail.com"
    click_button "Submit"
  end

end
