feature "Authentication" do
  scenario "A maker can sign in" do
    sign_up
    sign_in

    expect(page).to have_content 'Welcome BenSE'
  end

  scenario 'A maker sees an error if they get their email wrong' do
    sign_up

    visit '/sessions/new'
    fill_in "email", with: "wrong_email@gmail.com"
    fill_in "password", with: "password"
    click_button 'Sign In'

    expect(page).not_to have_content 'Welcome BenSE'
    expect(page).to have_content "Incorrect email or password"
  end

  scenario 'A maker sees an error if they get their password wrong' do
    sign_up

    visit '/sessions/new'
    fill_in "email", with: "bensheridanedwards@makers.com"
    fill_in "password", with: "wrong_password"
    click_button 'Sign In'

    expect(page).not_to have_content 'Welcome BenSE'
    expect(page).to have_content "Incorrect email or password"
  end

  scenario 'A maker can sign out' do
    sign_up
    sign_in
    click_button 'Sign Out'
  
    expect(page).to have_content 'You have signed out'
  end
end
