feature 'Logging in or out:' do

  scenario 'I get an initial welcome message' do
    visit '/'
    expect(page).to have_content 'Welcome to PeepShow.'
  end

  scenario 'I can log in' do
    user = create :user
    log_in_as user
    expect(page).to have_content "You are logged in as #{name_handle(user)}"
  end

  scenario 'I can log out' do
    user = create :user
    log_in_as user
    click_button 'Log out'
    expect(page).to have_content 'Welcome to PeepShow.'
  end

end
