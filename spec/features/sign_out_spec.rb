RSpec.feature "User signs out" do

  let!(:user){ User.create(email: "test@test.com", username: "test_user",
                name: "Testy Man", password: "passw0rd")}

  scenario "while signed in" do
    sign_in
    click_button 'Sign out'
    expect(page).not_to have_content "Welcome Testy"
  end
end
