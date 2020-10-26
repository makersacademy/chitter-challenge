feature 'there is a welcome and login page' do 
  scenario 'the user is welcomed to chitter' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter!'
  end
  scenario 'there is a button for logging in as a guest' do
    visit '/'
    expect(page).to have_button 'Continue as Guest'
  end
  scenario 'logging in takes you to the peeps page' do
    visit '/'
    click_button 'Continue as Guest'
    expect(current_path).to eq '/peeps'
  end
  scenario 'there is a button for logging in' do
    visit '/'
    click_button 'Log in'
    expect(current_path).to eq '/sessions/new'
  end
  scenario 'there is a button for signing up' do
    visit '/'
    expect(page).to have_button 'Sign Up'
  end
end
    