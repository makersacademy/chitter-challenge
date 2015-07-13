feature 'Password reset' do
  
  scenario 'requesting a password reset' do
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
end