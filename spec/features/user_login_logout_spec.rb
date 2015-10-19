feature 'Logging in or out:' do

  scenario 'I get an initial welcome message' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end

  xscenario 'I can log in' do
    user = create :user
    log_in(user)
    expect(page).to have_content "You are logged in as #{user_name(user)}"
  end
end
