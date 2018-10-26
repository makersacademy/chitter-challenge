feature 'sign up' do
  scenario 'Page should welcome the user' do
    visit '/'
    click_button 'Sign Up'
    expect(page).to have_content 'Just a few steps away'
  end

  scenario 'Page should accept user details' do
    visit '/'
    click_button 'Sign Up'
    fill_in('name', with: 'Ryan Clark')
    fill_in('email', with: 'fake@gmail.com')
    fill_in('username', with: 'RyanWolfen7')
    fill_in('password', with: '1234567890')
  end
end
