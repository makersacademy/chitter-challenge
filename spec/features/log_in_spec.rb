feature 'Log in' do
  scenario '> should return personalised welcome message' do
    sign_up_correctly
    visit '/'
    click_button 'Log in'
    fill_in :email, with: 'martymcfly@future.com'
    fill_in :password, with: 'password123'
    click_button 'Log in'
    expect(page).to have_content 'Welcome Marty'
  end

  scenario '> should not log in if password does not match' do
    sign_up_correctly
    visit '/'
    click_button 'Log in'
    fill_in :email, with: 'martymcfly@future.com'
    fill_in :password, with: 'wrong_password'
    click_button 'Log in'
    expect(page).not_to have_content 'Welcome Marty'
  end
end
