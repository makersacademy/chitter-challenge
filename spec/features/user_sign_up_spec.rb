feature 'Signing up as a user:' do

  scenario 'I can sign up as a new user' do
    user = build :user
    sign_up(user)
    expect(User.first.name).to eq(user.name)
  end

  scenario 'I get confirmation that I have signed in' do
    user = build :user
    sign_up(user)
    expect(page).to have_content("You are logged in as #{user_name(user)}")
  end

  xscenario 'I can log out' do
    user = create :user
    log_in(user)
    click_button 'Log out'
    expect(page).to have_content 'Welcome to Chitter'
  end
end
