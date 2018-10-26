feature "signing in" do
  scenario "'Sign In' button on main page" do
    visit '/'
    expect(page).to have_selector(:button, "Sign In")
  end
end
