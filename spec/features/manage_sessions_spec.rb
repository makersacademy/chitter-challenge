feature "Sign out" do
  scenario "Clear current user from session" do
    sign_in_sign_out("Dan MacCarthy","Dannylou","danMac@email.com","53cR3T")
    expect(page).not_to have_content "Signed in as: Dannylou"
    expect(page).to have_content "Please log in here"
  end
end

feature "Sign in" do
  xscenario "use username and email to sign in" do
    sign_in_sign_out("Dan MacCarthy","Dannylou","danMac@email.com","53cR3T")
    fill_in :user_name, with: "Dannylou"
    fill_in :email, with: "danMac@email.com"
    fill_in :password, with: "53cR3T"
    expect(page).to have_content "Signed in as: Dannylou"
  end
end
