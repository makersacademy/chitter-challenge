feature 'Sign up' do

  scenario 'The user can sign up as a new user' do
    visit '/user/new'
    expect(page.status_code).to eq(200)
    fill_in 'email', with: 'f@ke.email'
    fill_in 'username', with: 'EllieWem'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'password'
    click_button 'Sign up'
    expect(User.count).to eq(1)
  end

  scenario 'The user\'s username is displayed on the screen' do
    visit '/user/new'
    fill_in 'email', with: 'f@ke.email'
    fill_in 'username', with: 'EllieWem'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content("Hey EllieWem!")
  end

end
