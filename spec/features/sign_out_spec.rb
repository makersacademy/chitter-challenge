

feature 'Sign Out' do

  scenario 'can sign out' do
    sign_up
    click_button 'Sign Out'
    expect(current_path).to eq '/'
  end

  scenario 'when signed out returns to homepage' do
    sign_up
    user = User.first
    click_button 'Sign Out'
    expect(page).to have_content 'Welcome to Chitter!'
    expect(page).to_not have_content "Welcome #{user.user_name}"
  end

  scenario 'when signed out user_name in session is ended' do
    sign_up
    click_button 'Sign Out'
    expect(page).to_not have_content 'as4273'
  end

end