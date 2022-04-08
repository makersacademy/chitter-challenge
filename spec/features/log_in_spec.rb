feature "Signing in" do
  scenario "filling in the fields and submitting re-routes to home page with Welcome username" do
    create_user_and_log_in

    expect(current_path).to eq '/'
    expect(page).to have_content "Welcome, ChrisL"
  end

  scenario "entering invalid username, raises message 'Please check your username'" do
    visit('/')
    click_button("Log in")
    fill_in 'username', with: 'ChrisL'
    fill_in 'password', with: '12345'
    click_button 'Log in'

    expect(current_path).to eq '/sign-up'
    expect(page).to_not have_content "Welcome, ChrisL"
    expect(page).to have_css('h2', text: 'Please check your username')
  end

  scenario "entering invalid username, raises message 'Please check your password'" do
    create_user_and_post
    visit('/')
    click_button("Log in")
    fill_in 'username', with: 'ChrisL'
    fill_in 'password', with: '1111'

    expect(current_path).to eq '/sign-up'
    expect(page).to_not have_content "Welcome, ChrisL"
    # expect(page).to have_css('h2', text: 'Please check your password')
  end

  scenario "cannot sign in again once signed in" do
    create_user_and_log_in

    expect(page).to_not have_button 'Sign up'
    expect(page).to_not have_button 'Log in'
  end

end
