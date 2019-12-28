feature "sign in" do

  scenario "should be able to sign in an existing user" do
    sign_up
    sign_in
  
    expect(page).to have_content('Welcome, User1')
    expect(page).to have_current_path '/peeps'
  end

  scenario "deny access for unrecognized email" do
    sign_up
    sign_in_wrong_email
  
    expect(page).to have_content('Could not sign in, please check your email or password')
    expect(page).to have_current_path '/'
  end

  scenario "deny access for wrong password" do
    sign_up
    sign_in_wrong_password
  
    expect(page).to have_content('Could not sign in, please check your email or password')
    expect(page).to have_current_path '/'
  end

end