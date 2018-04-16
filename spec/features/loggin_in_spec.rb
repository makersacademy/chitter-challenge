feature 'Logging in' do
  scenario 'Creates user and get greet' do
    visit('/')
    click_button 'Create new user'
    fill_in('email', :with => 'test@test.co.uk' )
    fill_in('password', :with => 'Test123' )
    fill_in('name', :with => 'Tester' )
    fill_in('username', :with => 'DjTesto' )
    click_button 'Submit'
    expect(page).to have_content "Welcome Tester"
  end

  scenario 'Create user then log out' do
    create_user_tester
    click_button 'Sign out'
    expect(page).to have_content "You have signed out."
  end

  scenario 'Create user then log out and log in' do
    create_user_tester
    click_button 'Sign out'
    click_button 'Sign in'
    fill_in('email', :with => 'test@test.co.uk' )
    fill_in('password', :with => 'Test123' )
    click_button 'Sign in'
    expect(page).to have_content "Welcome Tester"
  end
end
