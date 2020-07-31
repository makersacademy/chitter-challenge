feature 'being logged in' do
  scenario 'User posts tweets with their username and name' do 
    register_test
    fill_in('New_peep', with: 'This is a test peep')
    click_button 'Submit new peep'
    expect(page).to have_content('testy mctestface (test123) at')
    expect(page).to have_content('This is a test peep')
  end
  scenario 'not being logged in posts as guest' do
    visit '/peeps'
    fill_in('New_peep', with: 'This is a test peep')
    click_button 'Submit new peep'
    expect(page).to have_content('Guest at')
    expect(page).to have_content('This is a test peep')
  end
  scenario 'there is a button for logging in' do
    visit '/'
    click_button 'Log in'
    expect(current_path).to eq '/sessions/new'
  end
  scenario 'logging in as existing user posts tweets with username and name' do
    create_test_user
    log_in_test
    fill_in('New_peep', with: 'This is a test peep')
    click_button 'Submit new peep'
    expect(page).to have_content('testy mctestface (test123) at')
    expect(page).to have_content('This is a test peep')
  end
  scenario 'logging out means posting as guest' do
    create_test_user
    log_in_test
    click_button 'Sign out'
    click_button 'Continue as Guest'
    fill_in('New_peep', with: 'This is a test peep')
    click_button 'Submit new peep'
    expect(page).to have_content('Guest at')
    expect(page).not_to have_content('testy mctestface (test123) at')
  end
end
