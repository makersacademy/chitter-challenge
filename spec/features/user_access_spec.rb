feature "signing up" do
  scenario "the user should see a welcome message when they sign up" do
    sign_up
    expect(page).to have_content "Welcome Tester"
  end
end

feature "logging in" do
  scenario "the user should see a welcome message when they log in" do
    sign_up
    sign_in
    expect(page).to have_content "Welcome Tester"
  end
end
