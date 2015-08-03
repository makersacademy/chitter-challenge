feature 'Password reset' do
  
  xscenario 'requesting a password reset' do
    user = User.create(name: 'banana man',
                email: 'banana@example.com', 
                username: 'bananaman1',
                password: 'banana123', 
                password_confirmation: 'banana123'
                )

    visit '/password_reset'
    fill_in 'email', with: user.email
    click_button 'Reset password'
    user = User.first(email: user.email)
    expect(user.password_token).not_to be_nil
    expect(page).to have_content 'Check your emails'
  end

  xscenario 'resetting password' do
    user = User.first
    user.password_token = 'token'
    user.save

    visit "/users/password_reset/#{user.password_token}"
    expect(page.status_code).to eq 200
    expect(page).to have_content 'Enter a new password'
  end
end