feature "Sign out" do
  scenario "Clear current user from session" do
    sign_in_sign_out("Dan MacCarthy","Dannylou","danMac@email.com","53cR3T")
    expect(page).not_to have_content "Signed in as: Dannylou"
    expect(page).to have_content "Please log in here"
  end
end

feature "Sign in" do
  scenario "link in header" do
    visit '/'
    click_link "Log in or sign up"
    expect(current_path).to eq '/session/new'
  end
  
  scenario "need correct username and password to sign in" do
    sign_in_sign_out("Dan MacCarthy","Dannylou","danMac@email.com","53cR3T")
    fill_in :user_name, with: "Dannylou"
    fill_in :password, with: "53cR3T"
    click_button "Log in"
    expect(page).to have_content "Signed in as: Dannylou"
  end

  scenario "incorrect details take you back to login page with message" do
    sign_in_sign_out("Dan MacCarthy","Dannylou","danMac@email.com","53cR3T")
    fill_in :user_name, with: "Dannypoo"
    fill_in :password, with: "53cR3T"
    click_button "Log in"
    expect(page).to have_content "Please log in here"
    expect(page).to have_content "username or password did not match"
  end

  scenario "link to sign up page" do
    visit '/session/new'
    click_link "Sign up"
    expect(current_path).to eq '/user/new'
  end
end
